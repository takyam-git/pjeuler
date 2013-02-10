#!/usr/bin/env ruby
# coding : utf-8
now = Time.now
data = File.read("matrix.txt")
matrix = data.each_line.map{|line| line.split(/,/).map(&:to_i)}
n = matrix.size
masu = Array.new(n).map! {Array.new(n) {|m| m = 0}}
masu[0][0] = matrix[0][0]
n.times do |x|
  n.times do |y|
    if y + 1 < n
      tmp = masu[x][y] + matrix[x][y + 1]
      if masu[x][y+1] == 0
        masu[x][y + 1] = tmp
      elsif tmp < masu[x][y+1]
        masu[x][y + 1] = tmp
      end
    end
    if x + 1 < n
      tmp = masu[x][y] + matrix[x + 1][y]
      if masu[x + 1][y] == 0
        masu[x + 1][y] = tmp
      elsif tmp < masu[x + 1][y]
        masu[x + 1][y] = tmp
      end
    end
  end
end
p masu[-1][-1]
p Time.now - now
