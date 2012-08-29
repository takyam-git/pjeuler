#!/usr/bin/env ruby
# encoding : utf-8
# 各自が新しく問題を解いた時に
# $ ruby make_euler_prob.rb {問題の数}
# とすることで自動的にディレクトリと問題説明文を生成してくれる
require 'rubygems'
require 'open-uri'
require 'nokogiri'
probrem_num = ARGV[0] || ""
if probrem_num !~ /\d?\d?\d/
  print "usage: ruby make_euler_prob.rb {Problem Number}\n"
  print "ex.  : ruby make_euler_prob.rb 12"
  exit
end

dir_name = "%03d" % probrem_num
if File.exist?(dir_name)
  puts "Problem #{dir_name} already exists."
  exit
end

begin
  doc = Nokogiri::HTML(open("http://odz.sakura.ne.jp/projecteuler/index.php?cmd=read&page=Problem%20" + probrem_num), nil, "utf-8")
  doc.css("#body").each do |body|
    if body.text.include?("雛形")
      puts "Problem #{probrem_num} NOT FOUND."
      exit
    end
    Dir.mkdir("%03d" % probrem_num)
    File.open(dir_name + "/description.txt", "w") do |file|
      puts body.text
      file.write "Project Euler - " + body.text
    end
  end
rescue Exception => e
  puts e.message
  exit
end

