i = 1
sum = 0

while i < 1000
  if i % 3 == 0 || i % 5 == 0
    sum = sum + i
  end
  i += 1  # i = i + 1
end

print(sum, "\n")

puts

#use method, use times
def euler001(max)
  i = 1
  sum = 0
  max.times do |i|
    if i % 3 == 0 || i % 5 == 0
      sum += i
    end
  end
  print(sum, "\n")
end

euler001(1000)