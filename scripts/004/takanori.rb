# encoding: utf-8
# 
# Project Euler - Problem 4
#   左右どちらから読んでも同じ値になる数を回文数という。 2桁の数の積で表される回文数のうち、
#   最大のものは 9009 = 91 × 99 である。
#   では、3桁の数の積で表される回文数のうち最大のものはいくらになるか。
#
max = 0
total = 0

100.upto(999) { |i|
    100.upto(999) { |j|
        total = i * j
        if max < total && total.to_s == total.to_s.reverse
            max = total
        end 
    }
}

puts max
