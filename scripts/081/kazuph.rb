#!/usr/bin/env ruby
# coding : utf-8
require "pp"
data = File.read("matrix.txt")
ary = data.each_line.map{|line| line.split(/,/).map(&:to_i)}
n = ary.size
masu = Array.new(n).map! {Array.new(n)}
masu[0][0] = ary[0][0]
n.times do |x|
  n.times do |y|
    masu[x][y + 1] = masu[x][y] + ary[x][y + 1] if (y + 1 < n) and (masu[x][y+1].nil? || masu[x][y] + ary[x][y + 1] < masu[x][y+1])
    masu[x + 1][y] = masu[x][y] + ary[x + 1][y] if (x + 1 < n) and (masu[x+1][y].nil? || masu[x][y] + ary[x+1][y] < masu[x+1][y])
  end
end
p masu[-1][-1]
