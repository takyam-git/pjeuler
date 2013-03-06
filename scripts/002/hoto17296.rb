a = 1
b = 1
sum = 0
loop do
  t = a; a = b; b += t
  sum += b if b % 2 == 0
  break if b > 4000000
end
p sum
