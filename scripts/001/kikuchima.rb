#!/usr/bin/env ruby

=begin
  Problem 1
  10未満の自然数のうち、3 もしくは 5 の倍数になっているものは 3, 5, 6, 9 の4つがあり、 これらの合計は 23 になる。
  同じようにして、1,000 未満の 3 か 5 の倍数になっている数字の合計を求めよ。
=end

num = 0
result = 0

while num < 1000 do
    if  0 == num % 3 || 0 == num % 5 then
    result = result + num
  end

  num += 1
end

puts result
