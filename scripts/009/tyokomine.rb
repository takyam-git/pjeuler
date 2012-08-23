# encoding:utf-8

def calc()
for i in 1..500
  for j in i..500
    a = i
    b = j
    c = Math.sqrt(i*i + j*j)
    if c.to_i == c
      if a+b+c==1000
        p a,b,c
        return a*b*c.to_i
      end
    end
  end
end
return 0
end
p calc()
