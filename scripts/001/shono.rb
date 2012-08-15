#!/usr/bin/env ruby

=begin

    Problem 1

    10未満の自然数のうち、3 もしくは 5 の倍数になっているものは 3, 5, 6, 9 の4つがあり、 これらの合計は 23 になる。
    同じようにして、1,000 未満の 3 か 5 の倍数になっている数字の合計を求めよ。

=end

num   = 1000
total = 0

num.times do |n|
    total += n if n and n % 3 == 0 or n % 5 == 0
end

puts total
