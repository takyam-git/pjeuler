# encoding: UTF-8
require('benchmark')
require('erb')

base_dir = File.dirname(File.expand_path(__FILE__)) + '/..'
scripts_dir = base_dir + '/scripts'
reports_dir = base_dir + '/reports'
benchmarks_dir = reports_dir + '/benchmarks'
lib_dir = base_dir + '/lib'
template_dir = lib_dir + '/templates'

#scriptsディレクトリから、数字だけで構成されているディレクトリ名一覧を取得する
all_quiz_directories = Dir::entries(scripts_dir).select{|dir_name| dir_name =~ /^[0-9]+$/ }.sort

#inits
title = Time.now.strftime('%Y/%m/%d %H:%M:%S')
content = "<h1>#{title}</h1>"
current_dir_name = ''
rows = ''

all_quiz_directories.each {|script_dir_name|
  #scripts/0xx ディレクトリから、先頭が.（ドット）で始まらないRubyファイル一覧を取得する
  dir_path = scripts_dir + '/' + script_dir_name
  all_script_files = Dir::entries(dir_path).select{|file_name| file_name =~ /^[^.]+\.rb$/}.sort
  rows = ''
  current_dir_name = script_dir_name
  results = []
  all_script_files.each {|file_name|
    file_path = dir_path + '/' + file_name
    stdout = ''
    status = 0
    result = Benchmark::measure{
      stdout = `ruby #{file_path}`
      status = $?.to_i
    }
    results.push({:file_name => file_name, :time => result.real, :stdout => stdout, :status => status})
  }

  # 実行タイムでソート
  results.sort!{|a, b| a[:time] <=> b[:time]}

  results.each {|result|
    rows += "<tr><td>#{script_dir_name}</td><td>#{result[:file_name]}</td>"
    if result[:status] == 0
      rows += "<td>#{"%.2f" % ((result[:time] * 100000).ceil().to_f / 100)}</td><td>#{result[:stdout].to_s.chomp.gsub(/\r\n|\r|\n/, '<br>')}</td>"
    else
      rows += "<td colspan=\"2\">スクリプト実行に失敗しました</td>"
    end
    rows += "</tr>"
  }
  content += ERB.new(File.read(template_dir + '/report.erb')).result
}

layout = ERB.new(File.read(template_dir + '/layout.erb'))
File.write(benchmarks_dir + '/benchmark_' + Time.now.strftime('%Y%m%d_%H%M%S') + '.html', layout.result)

reports = Dir::entries(benchmarks_dir).select{|file_name| file_name =~ /benchmark_.+\.html$/}.sort.reverse
content = ERB.new(File.read(template_dir + '/reports.erb')).result
File.write(reports_dir + '/index.html', layout.result)
