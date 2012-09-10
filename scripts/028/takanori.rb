# encoding: utf-8
# 
# Project Euler - Problem 28
#    1から初めて右方向に進み時計回りに数字を増やしていき, 5×5の螺旋が以下のように生成される:
#    両対角線上の数字の合計は101であることが確かめられる.
#    1001x1001の螺旋を同じ方法で生成したとき, 対角線上の数字の合計はいくつだろうか?
#
i = 2
j = 1
total = 1

while (i+1 <= 1001)
    4.times do
        j += i
        total += j
    end
    i += 2
end

p total
