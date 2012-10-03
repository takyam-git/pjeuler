#! /usr/bin/env ruby
#coding: utf-8

def check(n, base)
  s = n.to_s(base)
  s == s.reverse
end

answer = 0

(1...1000000).each do |n|
  answer += n if check(n, 2) && check(n, 10)
end

puts answer