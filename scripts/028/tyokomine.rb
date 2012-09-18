# encoding : utf-8
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
