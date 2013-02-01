#!/usr/bin/env ruby
# coding : utf-8
require "pp"
data = File.read("matrix.txt")
ary = data.each_line.map{|line| line.split(/,/).map(&:to_i)}
x = ary.length - 1
y = ary.length - 1
# p ary[x][y]
sum = ary[x][y]
(2 * (ary.length - 1)).times do
  if x == 0
    y -= 1
    sum += ary[x][y]
    next
  end
  if y == 0
    x -= 1
    sum += ary[x][y]
    next
  end
  if ary[x-1][y] < ary[x][y-1]
    x -= 1
  else
    y -= 1
  end
  sum += ary[x][y]
  p [ary[x][y], x, y]
end
p sum
