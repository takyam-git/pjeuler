#!/usr/bin/env ruby
# encoding : utf-8
# Problem 28  †
# 1から初めて右方向に進み時計回りに数字を増やしていき, 5×5の螺旋が以下のように生成される:
# 21 22 23 24 25
# 20  7  8  9 10
# 19  6  1  2 11
# 18  5  4  3 12
# 17 16 15 14 13
# 両対角線上の数字の合計は101であることが確かめられる.
# 1001×1001の螺旋を同じ方法で生成したとき, 対角線上の数字の合計はいくつだろうか?
num = 1001
p 3.step(num, 2).inject(1) {|sum, n|
  sum += 2 * (2 * n * n - 3 * (n - 1))
}
