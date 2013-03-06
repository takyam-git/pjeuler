n = 600851475143
i = 3

while n > i*3
  if n % i == 0
    n /= i
  else
    i += 2
  end
end

p n
