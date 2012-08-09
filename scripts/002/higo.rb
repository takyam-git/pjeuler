ary = [1,2]
nextnum = ary[-1] + ary[-2]
sum = 2 #loopは2の次から始まるので。
loop do 
  break if nextnum > 4000000
  sum += nextnum if (nextnum % 2).zero?
  ary << nextnum
  nextnum = ary[-1] + ary[-2]
end
p sum
