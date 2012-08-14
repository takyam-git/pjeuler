# encoding: utf-8
# 
# Project Euler - Problem 4
#   左右どちらから読んでも同じ値になる数を回文数という。 2桁の数の積で表される回文数のうち、
#   最大のものは 9009 = 91 × 99 である。
#   では、3桁の数の積で表される回文数のうち最大のものはいくらになるか。
#
max = 0
total = 0

999.downto(100) { |i|
    999.downto(100) { |j|
        # break 入れてみた
        if max >= i * j
            break
        end
        total = i * j
        if max < total && total.to_s == total.to_s.reverse
            max = total
        end 
    }
}
puts max
