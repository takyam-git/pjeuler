ans = 0
for i in 1..1000
  ans += i ** i
end
p ans % (10**10)
