# encoding:utf-8

def calc()
for i in 1..300
  for j in i..400
    a = i
    b = j
    c = Math.sqrt(i*i + j*j)
    if c.to_i == c
      if a+b+c==1000
        return a*b*c.to_i
      end
    end
  end
end
return 0
end
p calc()
