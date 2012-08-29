#!/usr/bin/env ruby
# coding : utf-8

# t = Time.now

p (0..1/0.0).inject([1, 1]){|fib, i|
  fib << fib[i] + fib[i + 1]
  break fib if fib[-1].to_s.length >= 1000
  fib
}.count

# a , b = 1, 1
# count = 2
# while b.to_s.length < 1000
#   count += 1
#   a , b = b , a + b
# end
# p count

# p Time.now - t
