#!/usr/bin/env ruby
# encoding : utf-8
# Problem 37  †
# 3797は面白い性質を持っている.
# まずそれ自身が素数であり, 左から右に桁を除いたときに全て素数になっている (3797, 797, 97, 7). 同様に右から左に桁を除いたときも全て素数である (3797, 379, 37, 3).
# 右から切り詰めても左から切り詰めても素数になるような素数は11個しかない. 総和を求めよ.
# 注: 2, 3, 5, 7を切り詰め可能な素数とは考えない.
require 'set'
# t = Time.now

# 素数の判定
def prime?(num, ary)
  ary.each do |n|
    break if n * n  > num
    return false if num % n == 0
  end
  return true
end

# 素数を列挙
def primes (max)
  n = 0
  prime_ary = [2, 3, 5]
  while  prime_ary[-1] < max
    n += 1
    # 素数は６の倍数±１上にしか存在しない
    prime = 6 * n + 1
    if prime?(prime, prime_ary)
      prime_ary << prime
    end
    prime += 4
    if prime?(prime, prime_ary)
      prime_ary << prime
    end
  end
  prime_ary
end

# 切り詰めても素数か判定
def cut_bad_prime? (prime, set)
  n = prime.to_s
  n.length > 1 && (1..(n.length-1)).all? do |i|
    set.include?(n[0..(-1-i)].to_i) && set.include?(n[i..-1].to_i)
  end
end

prime_set = Set.new(primes(1_000_000))
p prime_set.select{|n| cut_bad_prime?(n, prime_set)}.inject(:+)
# puts "実行時間：%.0f msec" %  ((Time.now - t)*1000).to_i
