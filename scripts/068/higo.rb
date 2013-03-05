# 1-6-7
# 2-7-8
# 3-8-9
# 4-9-10
# 5-10-6

num = (1..10).to_a
gon = Array.new

num.permutation.each do |a|
  # 外側のnodeの最小じゃない時
  next if [ a[0], a[1], a[2], a[3], a[4] ].min != a[0] 
  next if a[0] + a[5] + a[6] != a[1] + a[6] + a[7]
  next if a[0] + a[5] + a[6] != a[2] + a[7] + a[8]
  next if a[0] + a[5] + a[6] != a[3] + a[8] + a[9]
  next if a[0] + a[5] + a[6] != a[4] + a[9] + a[5]

  gon.push a
end

ans = Array.new
gon.each do |a|
  ary = Array.new
  ary.push(a[0],a[5],a[6])
  ary.push(a[1],a[6],a[7])
  ary.push(a[2],a[7],a[8])
  ary.push(a[3],a[8],a[9])
  ary.push(a[4],a[9],a[5])
  ans.push(ary.join().to_i)
end

ans.sort.reverse.each do |n|
  next if n > 10_000_000_000_000_000
  p n
  break
end
