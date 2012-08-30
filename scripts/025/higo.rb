#start = Time.now
f2 = 1
f1 = 1
f = 2
i = 3
max = 10 ** 999

while f < max
  f2 = f1
  f1 = f
  f = f2 + f1
  i += 1
end
#p f
p i
#print "took " + ((Time.now - start) * 1000).round.to_s + "ms.\n"

