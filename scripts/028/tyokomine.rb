<<<<<<< HEAD
# encoding : utf-8
=======
# encoding: utf-8
>>>>>>> 2f6fbd2b05e5c96d0a36b9423081cb8f06fc288b
cnt = 1 
add = 0                                                                          
num = 3 
ans = 1
loop do
  num += 1
  if num % 4 == 0
    add += 2
  end
  cnt += add
  break if add >1001
  ans += cnt
end
p ans 
