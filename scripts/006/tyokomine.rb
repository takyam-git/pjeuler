# coding:utf-8
plus=0
plus2=0

for i in 1..100
  plus += i
  plus2 += i*i
end
p  plus*plus - plus2
