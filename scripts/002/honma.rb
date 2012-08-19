MAX = 400_0000
sum = 0
a,  b = 1,  1
while a < MAX
  sum = sum + a if a % 2 == 0
  a,  b = a + b,  a
end
puts sum
