#!/usr/bin/env ruby
# encoding : utf-8
# Problem 36  †
# 585 = 10010010012 (2進) は10進でも2進でも回文数である.
# 100万未満で10進でも2進でも回文数になるような数の総和を求めよ.
# (注: 先頭に0を含めて回文にすることは許されない.)
p (1..999_999).select{|n| n.to_s == n.to_s.reverse and n.to_s(2) == n.to_s(2).reverse}.inject(:+)
