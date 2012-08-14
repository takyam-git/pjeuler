def calc(max)
  a, b, c = 1, 2, 0
  sum = 2
  while(c < (max - a))
    c = a + b
    sum += c if c % 2 == 0
    a = b
    b = c
  end
  sum
end

p calc(4000000)
