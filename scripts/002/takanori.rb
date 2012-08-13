# encoding: utf-8
#
# Project Euler - Problem 2
#  フィボナッチ数列の項は前の2つの項の和である。 最初の2項を 1, 2 とすれば、最初の10項は以下の通りである。
#  1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
#  数列の項の値が400万を超えない範囲で、偶数値の項の総和を求めよ。
#
i = 0
j = 1
k = 0
total = 0

while i < 4000000
    k = i + j
    total += k if k.even?
    i = j
    j = k
end

puts total
