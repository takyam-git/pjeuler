#!/usr/bin/env ruby
# encoding : utf-8
# Problem 20  †
# n × (n - 1) × ... × 3 × 2 × 1 を n! と表す。
# 例えば、10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800
# となる。
# この数の各桁の合計は
# 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27
# である。
# では、100! の各桁の数字の合計を求めよ。
# p (1..10).inject(:*).to_s.split(//).map(&:to_i).inject(:+)
p (1..100).inject(:*).to_s.split(//).map(&:to_i).inject(:+)
