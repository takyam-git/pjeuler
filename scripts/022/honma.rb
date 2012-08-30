#!/usr/bin/env ruby
# coding : utf-8
ary = []
File.open("names.txt") do |file|
  ary = file.read.gsub("\"", "").split(/,/)
end
alpha = %w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z);
ary.sort!
sum = 0
ary.each_with_index do |w, i|
  sum += (i + 1) * w.split(//).map{|s|alpha.index(s) + 1}.inject(&:+)
end
p sum

