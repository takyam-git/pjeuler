# encoding: UTF-8
require('benchmark')
require('erb')

base_dir = File.dirname(File.expand_path(__FILE__)) + '/..'
scripts_dir = base_dir + '/scripts'
reports_dir = base_dir + '/reports'
benchmarks_dir = reports_dir + '/benchmarks'
lib_dir = base_dir + '/lib'
template_dir = lib_dir + '/templates'

github_scripts_url = 'https://github.com/takyam-git/pjeuler/blob/master/scripts'

#scriptsディレクトリから、数字だけで構成されているディレクトリ名一覧を取得する
all_quiz_directories = Dir::entries(scripts_dir).select{|dir_name| dir_name =~ /^[0-9]+$/ }.sort.reverse

#inits erbのBinding用
title = Time.now.strftime('%Y/%m/%d %H:%M:%S')
content = "<h1>#{title}</h1>"
current_dir_name = ''
rows = ''
result = {}
num = 0
description = ''
number = 0

all_quiz_directories.each {|script_dir_name|
  number += 1
  #scripts/0xx ディレクトリから、先頭が.（ドット）で始まらないRubyファイル一覧を取得する
  dir_path = scripts_dir + '/' + script_dir_name
  all_script_files = Dir::entries(dir_path).select{|file_name| file_name =~ /^[^.]+\.rb$/}.sort

  results = []
  all_script_files.each {|file_name|
    file_path = dir_path + '/' + file_name
    stdout = ''
    status = 0
    tms = Benchmark::measure{
      stdout = `timeout -s 9 60 ruby #{file_path}`
      status = $?.to_i
    }
    results.push({:file_name => file_name, :time => tms.real, :stdout =>  ERB::Util.html_escape(stdout), :status => status})
  }

  # 実行タイムでソート
  results.sort!{|a, b| a[:time] <=> b[:time]}

  rows = ''
  current_dir_name =  ERB::Util.html_escape(script_dir_name)
  num = 0
  results.each {|res|
    result = res
    num += 1
    rows += ERB.new(File.read(template_dir + '/row.erb')).result
  }

  description = ''
  description_path = dir_path + '/description.txt'
  if File.exists?(description_path)
    description =  ERB::Util.html_escape(File.read(description_path).gsub(/\r\n|\r|\n/, '<br>'))
  end

  content += ERB.new(File.read(template_dir + '/report.erb')).result
}

layout = ERB.new(File.read(template_dir + '/layout.erb'))
File.write(benchmarks_dir + '/benchmark_' + Time.now.strftime('%Y%m%d_%H%M%S') + '.html', layout.result)

reports = Dir::entries(benchmarks_dir).select{|file_name| file_name =~ /benchmark_.+\.html$/}.sort.reverse
content = ERB.new(File.read(template_dir + '/reports.erb')).result
File.write(reports_dir + '/index.html', layout.result)
