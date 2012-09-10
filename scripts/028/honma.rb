#!/usr/bin/env ruby
# encoding : utf-8
# Problem 28  †
# 1から初めて右方向に進み時計回りに数字を増やしていき, 5×5の螺旋が以下のように生成される:
# 21222324252078910196121118543121716151413
# 両対角線上の数字の合計は101であることが確かめられる.
# 1001×1001の螺旋を同じ方法で生成したとき, 対角線上の数字の合計はいくつだろうか?
num = 1001
sum = count = num * num
hikukazu = (num - 1)
catch(:finish) do
  while true
    4.times do
      count -= hikukazu
      sum += count
      throw :finish if count == 1
    end
    hikukazu -= 2
  end
end
p sum
