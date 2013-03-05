numbers = [*1..10].permutation(10)
aa = []
bb = {}
numbers.each do |n|
  a = n[7]+n[1]+n[0]
  b = n[6]+n[0]+n[4]
  c = n[5]+n[4]+n[3]
  d = n[9]+n[3]+n[2]
  e = n[8]+n[2]+n[1]
  if a == b and a == c and a == d and a == e
    x = [[n[7],n[1],n[0]], [n[6],n[0],n[4]], [n[5],n[4],n[3]], [n[9],n[3],n[2]], [n[8],n[2],n[1]]]
    key = x.map(&:join).sort!.join(':')
    next if bb.key?(key)
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