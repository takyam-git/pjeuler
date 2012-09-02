#!/usr/bin/env ruby
# encoding : utf-8
# 最大の素因数が求まればいいので配列に入れるのをやめた
def factorization (num)
  max = 0
  # 2, 3, 5
  [2, 3, 5].each do |prime|
    num % prime == 0 && max = prime && num /= prime
  end
  # 7以降の素数候補で割る
  n = 0
  while true
    n += 1
    prime = 6 * n + 1
    break if prime * prime > num
    num % prime == 0 && max = prime && num /= prime
    prime += 4
    break if prime * prime > num
    num % prime == 0 && max = prime && num /= prime
  end
  max = num
  return max
end
p factorization(600851475143)
