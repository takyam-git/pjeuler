result = 0
for a in 1..100
  for b in 1..100
    c = a ** b
    d = 0
    loop do
      d += c%10
      c = c/10
      break if c < 1
    end
    if result < d
      result = d
    end
  end
end
p result
