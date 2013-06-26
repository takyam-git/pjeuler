d=a=600851475143
s=2
while s<=d
  if d%s == 0
    d/=s
    next
  end
  s+=1
end
p s
