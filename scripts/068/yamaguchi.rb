#num_ary=[*1..10]
#numbers = []
#num_ary.each do |num1|
#  ary1 = num_ary.clone
#  ary1.delete(num1)
#  ary1.each do |num2|
#    ary2 = ary1.clone
#    ary2.delete(num2)
#    ary2.each do |num3|
#      ary3 = ary2.clone
#      ary3.delete(num3)
#      ary3.each do |num4|
#        ary4 = ary3.clone
#        ary4.delete(num4)
#        ary4.each do |num5|
#          ary5 = ary4.clone
#          ary5.delete(num5)
#          ary5.each do |num6|
#            ary6 = ary5.clone
#            ary6.delete(num6)
#            ary6.each do |num7|
#              ary7 = ary6.clone
#              ary7.delete(num7)
#              ary7.each do |num8|
#                ary8 = ary7.clone
#                ary8.delete(num8)
#                ary8.each do |num9|
#                  ary9 = ary8.clone
#                  ary9.delete(num9)
#                  ary9.each do |num10|
#                    numbers.push [num1, num2, num3, num4, num5, num6, num7, num8, num9, num10]
#                  end
#                end
#              end
#            end
#          end
#        end
#      end
#    end
#  end
#end
numbers = [*1..10].permutation(10)
aa = []
bb = {}
numbers.each do |n|
  #p n
  #s = n.size
  #n.uniq!
  #next if n.size != s or n.index(0) != nil or n.index(7) != nil or n.index(8) != nil or n.index(9) != nil
  #821, 932, 10 43, 654, 715
  a = n[7]+n[1]+n[0]
  b = n[6]+n[0]+n[4]
  c = n[5]+n[4]+n[3]
  d = n[9]+n[3]+n[2]
  e = n[8]+n[2]+n[1]
  if a == b and a == c and a == d and a == e
    x = [[n[7],n[1],n[0]], [n[6],n[0],n[4]], [n[5],n[4],n[3]], [n[9],n[3],n[2]], [n[8],n[2],n[1]]]
    key = x.map(&:join).sort!.join(':')
    next if bb.key?(key)
    #p n.join.to_s + ':' + n[3].to_s + n[2].to_s + n[1].to_s + '>' + a.to_s + ':' + n[4].to_s + n[0].to_s + n[2].to_s + '>' + b.to_s + ':' + n[5].to_s + n[1].to_s + n[0].to_s + '>' + c.to_s
    bb[key] = true
    aa.push x
  end
end
v = 0
aa.each do |a|
  a1 = a[0]
  a2 = a[1]
  a3 = a[2]
  a4 = a[3]
  a5 = a[4]
  f = [a1[0],a2[0],a3[0],a4[0],a5[0]]
  start = f.index(f.min)
  w = []
  0.upto(4) do |h|
    u = start + h
    u = u - 5 if u >= 5
    w.push(a[u])
  end
  t = w.flatten.join
  next if t.size > 16
  t = t.to_i
  v = t if v < t
end
p v
#128, 239,3410,456,567



#
#[1, 2, 3, 4, 5, 6]
#432, 513, 621

#aa = []
#bb = {}
#123456.upto(654321) do |num|
#  n = num.to_s.split(//).map(&:to_i)
#  s = n.size
#  n.uniq!
#  next if n.size != s or n.index(0) != nil or n.index(7) != nil or n.index(8) != nil or n.index(9) != nil
#  a = (n[3]+n[2]+n[1])
#  b = (n[4]+n[0]+n[2])
#  c = (n[5]+n[1]+n[0])
#  if a == b and b == c
#    key = [[n[3],n[2],n[1]].join.to_i, [n[4],n[0],n[2]].join.to_i, [n[5],n[1],n[0]].join.to_i].sort!.join(':')
#    next if bb.key?(key)
#    #p num.to_s + ':' + n[3].to_s + n[2].to_s + n[1].to_s + '>' + a.to_s + ':' + n[4].to_s + n[0].to_s + n[2].to_s + '>' + b.to_s + ':' + n[5].to_s + n[1].to_s + n[0].to_s + '>' + c.to_s
#    bb[key] = true
#    aa.push num
#  end
#end
#p aa
#
#numbers.each do |a1, a2, a3|
#  numbers.each do |b1, b2, b3|
#    next if a1 == b1 or a1 == b2 or a1 == b3 or a2 == b1 or a2 == b2 or a2 == b3 or a3 == b1 or a3 == b2 or a3 == b3
#    numbers.each do |c1, c2, c3|
#
#      p [[a1,a2,a3],[b1,b2,b3]]
#    end
#  end
#end