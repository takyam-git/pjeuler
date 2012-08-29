#!/usr/bin/env ruby
# encoding : utf-8
File.open("triangle.txt") do |file|
  @ary = file.each_line.map{|line| line.chomp!.split(/ /).map(&:to_i)}
end
# ルート検索をするのではなく下から順に大きい方を加算していく
(@ary.length - 2).downto(0) do |j|
  @ary[j].each_index do |i|
    @ary[j][i] += @ary[j + 1][i..(i+1)].max
  end
  @ary.pop
  # @ary.map{|row|p row}
end
p @ary[0][0]
