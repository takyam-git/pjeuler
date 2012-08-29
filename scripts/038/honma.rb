#!/usr/bin/env ruby
# encoding : utf-8
# Problem 38  †
# 192を1, 2, 3で掛けてみよう.
#    192 × 1 = 192
#    192 × 2 = 384
#    192 × 3 = 576
# 積を連結することで1から9のPandigital数 192384576 が得られる.
# 192384576を 192と(1,2,3)の連結積と呼ぶ.
# 同じようにして, 9を1,2,3,4,5と掛け連結することでPandigital数918273645が得られる. これは9と(1,2,3,4,5)との連結積である.
# 整数と(1,2,...,n) (n > 1) との連結積として得られる9桁のPandigital数の中で最大のものを答えよ.
t = Time.now
pandigital_nums = []
# 自分自身とそれを倍するものを連結したときに9桁を超えてしまう数以降はやらない
(1..9999).each do |num|
  pandigital_num = (1..9).inject(""){|str,  n|
    str += (num * n).to_s
    str.length < 8 ? str : (break str)
  }
  next if pandigital_num.length > 9
  next if !(1..9).all?{|m|pandigital_num.include?(m.to_s)}
  pandigital_nums << pandigital_num
end
p pandigital_nums.max
p Time.now - t
