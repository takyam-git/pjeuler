# encoding: utf-8
class Script < ActiveRecord::Base
  has_many :benches, :order => 'updated_at DESC'
  attr_accessible :recent, :dir, :file, :is_deleted, :times

  #scriptsディレクトリ以下のファイルからまだDBに格納されてないファイルをDBにINSERTする
  def self.refresh_scripts
    #すでにDBに格納されてるスクリプトを「directory/file_name」の形式で配列に格納
    scripts = Script.find_by_sql('SELECT CONCAT(dir, "/", file) AS path FROM scripts').map{|script| script.path}

    #scriptsディレクトリ以下のディレクトリを取得
    directories = Dir::entries(SCRIPTS_DIR_BASE).select{|dir_name| dir_name =~ /^[0-9a-zA-Z\-_]+$/ }.sort

    #まだDBに格納されてないScriptをhashに保存
    new_scripts = {}
    directories.each do |directory|
      dir_path = SCRIPTS_DIR_BASE + '/' + directory
      dir_files = Dir::entries(dir_path)
                    .select{|file_name| file_name =~ /^[^.]+\.(rb|php|pl|py|js)$/}
                    .select{|file| scripts.index(directory + '/' + file).nil? }
      new_scripts[directory] = dir_files if dir_files.size > 0
    end

    new_scripts.each do |directory, files|
      files.each do |file|
        script = Script.new({
          dir: directory,
          file: file,
        })
        script.save
        script.run_bench
      end
    end

    return new_scripts
  end

  #スクリプトを叩いて結果をDBに保存する
  def run_bench
    script_path = SCRIPTS_DIR_BASE + '/' + self.dir + '/' + self.file

    result = nil
    stdout = ''
    case File.extname(self.file).to_s
      when '.rb'
        result, stdout = Script::run_ruby(script_path)
      when '.php'
        result, stdout = Script::run_php(script_path)
      when '.pl'
        result, stdout = Script::run_perl(script_path)
      when '.py'
        result, stdout = Script::run_python(script_path)
      when '.js'
        result, stdout = Script::run_js(script_path)
    end

    if result.nil?
      return false
    end

    bench = Bench.new({ script_id: self.id, result: result, stdout: stdout })
    bench.save()

    cnt = Bench.find(:all, :select => 'COUNT(*)', :conditions => ['script_id = ?', self.id])

    self.recent = result
    self.times = cnt
    self.save

    return bench
  end

  def self.dirs
    self.find_by_sql('
      SELECT
        dir,
        file,
        MIN(recent) AS recent
      FROM (
          SELECT
            *
          FROM
            scripts
          ORDER BY
            recent ASC
        ) AS s
      GROUP BY
        dir
      ORDER BY
        dir DESC
    ')
  end

  def self.dir_scripts(dir)
    self.where('dir = ?', dir).order('recent ASC')
  end

  def self.run_ruby(file_path)
    return self::parse_command("ruby #{Rails.root}/benchmark_scripts/benchmark.rb #{file_path}")
    #return ((rand(60).to_s + '.' + rand(59).to_s).to_f), 'rubyだよー'
  end

  def self.run_php(file_path)
    return self::parse_command("php #{Rails.root}/benchmark_scripts/benchmark.php #{file_path}")
    #return ((rand(60).to_s + '.' + rand(59).to_s).to_f), 'phpだよー'
  end

  def self.run_perl(file_path)
    return self::parse_command("perl #{Rails.root}/benchmark_scripts/benchmark.pl #{file_path}")
    #return ((rand(60).to_s + '.' + rand(59).to_s).to_f), 'perlだよー'
  end

  def self.run_python(file_path)
    return self::parse_command("python #{Rails.root}/benchmark_scripts/benchmark.py #{file_path}")
    #return ((rand(60).to_s + '.' + rand(59).to_s).to_f), 'perlだよー'
  end

  def self.run_js(file_path)
    return self::parse_command("node #{Rails.root}/benchmark_scripts/benchmark.js #{file_path}")
    #return ((rand(60).to_s + '.' + rand(59).to_s).to_f), 'perlだよー'
  end

  def self.parse_command(command)
    stdout = nil
    status = 1
    time = 999.999
    timeout(60) do
      begin
        stdout = `#{command}`
        if stdout.size > 0
          lines = stdout.split(/(\r\n|\r|\n)/)
          time = lines[0].to_f
          p lines
          if lines.size > 1
            if lines.size > 2
              stdout = ''
              1.upto(lines.size - 1) do |i|
                stdout += lines[i]
              end

              p stdout
            else
              stdout = lines[1]
            end
            status = 0
          end
        end
      rescue Exception => e
        case e
          when Timeout::Error
            status = 1
            stdout = "Timeout Error: #{e.to_s}"
        end
      end
    end
    if status != 0
      stdout = '!!ERROR!!' if stdout.nil?
      time = 999.999
    end
    return time, stdout
  end

  def self.run_command(command)
    stdout = nil
    status = 1
    time = 999.999
    timeout(60) do
      begin
        start = Time.now
        stdout = `#{command}`
        time = Time.now - start
        p time
        status = $?
        p status
      rescue Exception => e
        case e
          when Timeout::Error
            status = 1
            stdout = "Timeout Error: #{e.to_s}"
        end
      end
    end
    if status != 0
      stdout = '!!ERROR!!' if stdout.nil?
      time = 999.999
    end
    return time, stdout
  end
end
