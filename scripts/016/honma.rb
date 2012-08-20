#!/usr/bin/env ruby
# encoding : utf-8
# Problem 16  †
# 2^15 = 32768 であり、これの各数字の合計は 3 + 2 + 7 + 6 + 8 = 26 となる。
# 同様にして、2^1000 の各数字の合計を求めよ。
p((2 ** 1000).to_s.split(//).map(&:to_i).inject(&:+))
