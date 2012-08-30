#!/usr/bin/env ruby
# coding : utf-8

# t = Time.now
max = 10 ** 999
# p (0..1/0.0).inject([1, 1]){|fib, i|
#   fib << fib[i] + fib[i + 1]
#   break fib if fib[-1] > max
#   fib
# }.count

# while を使ってもあんまり変わらない
a , b = 1, 1
count = 2
while b < max
  count += 1
  a , b = b , a + b
end
p count

# 一般項を使うぜ
# n = 1
# sqrt5 = Math.sqrt(5)/2.0
# while true
#   fib = ((0.5 + sqrt5)**n - (0.5 - sqrt5)**n)/sqrt5
#   break if fib.to_i.to_s.length >= 1000 # =>  `to_i': Infinity (FloatDomainError)
#   n += 1
# end
# p n
# p Time.now - t
