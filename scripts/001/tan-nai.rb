ans = 0

1000.times do |target|
  ans += target if target % 3 == 0 or target % 5 == 0
  target += 1
end
puts ans
