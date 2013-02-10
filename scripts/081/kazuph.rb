#!/usr/bin/env ruby
# coding : utf-8
require "pp"
data = File.read("matrix.txt")
ary = data.each_line.map{|line| line.split(/,/).map(&:to_i)}
n = ary.size
masu = Array.new(n).map! {Array.new(n){|m| m = 99999999999}}
p masu[0][0] = ary[0][0].to_i
n.times do |x|
  n.times do |y|
    masu[x][y + 1] = masu[x][y] + ary[x][y + 1].to_i if y + 1 < n and (masu[x][y] + ary[x][y + 1].to_i < masu[x][y+1])
    masu[x + 1][y] = masu[x][y] + ary[x + 1][y].to_i if x + 1 < n and (masu[x][y] + ary[x+1][y].to_i < masu[x+1][y])
  end
end
p masu[-1][-1]
