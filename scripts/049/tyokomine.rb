# coding: utf-8
# 項差3330の等差数列1487, 4817, 8147は次の2つの変わった性質を持つ.
#
# (i)3つの項はそれぞれ素数である. 
# (ii)各項は他の項の置換で表される. 
# 1, 2, 3桁の素数にはこのような性質を持った数列は存在しないが, 4桁の増加列にはもう1つ存在する.
#
# それではこの数列の3つの項を連結した12桁の数を求めよ.
require 'prime'

for i in 1488..9000
  next if i%6 == 4 || i%6 == 1
  next if !i.prime?
  for j in i+1..9999
    k = j + j - i
    next if k > 10_000
    next if j%6 == 4 || j%6 == 1
    next if k%6 == 4 || k%6 == 1
    next if !j.prime?
    next if !k.prime?
    i_s = i.to_s.split('').sort.join
    j_s = j.to_s.split('').sort.join
    next if i_s != j_s
    k_s = k.to_s.split('').sort.join
    next if k_s != i_s
    p i.to_s+j.to_s+k.to_s 
  end
end






