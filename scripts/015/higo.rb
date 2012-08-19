n = 20
ary = [ [1] ]
(1.. 2*n).each do |i|
  ary[i] = []
  ary[i] << ary[i-1][0] if i <= n
  ary[i-1].size.times do |j|
    break if j >= ary[i-1].size - 1
    ary[i] << ary[i-1][j] + ary[i-1][j+1]
  end
  ary[i] << ary[i-1][-1] if i <= n
  #puts ary[i].to_s + ":" + ary[i].size.to_s
end
p ary[-1][-1]
