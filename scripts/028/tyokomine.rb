cnt = 1 #
add = 0 #2ずつたす                                                                         
num = 3 #繰り返し回数
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
