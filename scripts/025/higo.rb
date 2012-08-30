f2 = 1
f1 = 1
f = 2
i = 3

while f < 10 ** 999
  f2 = f1
  f1 = f
  f = f2 + f1
  i += 1
end
#p f
p i

