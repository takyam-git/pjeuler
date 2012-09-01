max = 10 ** 999 
a , b = 1, 1                                                                                                
count = 2 
while b < max 
  count += 1
  a , b = b , a + b 
end 
p count