# encoding: utf-8
#
# Project Euler - Problem 7
#   素数を小さい方から6つ並べると 2, 3, 5, 7, 11, 13 であり、6番目の素数は 13 である。
#   10001 番目の素数を求めよ。
#
require 'prime'

i = 2
j = 1

loop do
    if i.prime?
        j += 1
    end
    if j > 10001
        break
    end
    i += 1
end
puts i
