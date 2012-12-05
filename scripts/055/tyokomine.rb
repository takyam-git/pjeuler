result = 0
for i in 0...10000
  str = i.to_s
  for j in 0..50
    break if str == str.reverse && j > 0
    str = (str.to_i + str.reverse.to_i).to_s
  end
  if str != str.reverse
    result += 1
  end
end
p result
