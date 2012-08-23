# encoding:utf-8

def calc()
for a in 1..300
  for b in a..400
    c = 1000-(a + b)
    if a*a+b*b == c*c
     return a*b*c
   end
  end
end
return 0
end
p calc()
