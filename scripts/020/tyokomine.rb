max = 100
a=1
max.downto(1){|i|
  a *= i
}
ary = a.to_s.split(//)
ans = 0
ary.each do |i|
  ans += i.to_i
end
p ans
