# encoding:utf-8

#fib = Array.new
#fib << 1
#fib << 1
#i=2
#loop do
#  fib[i]=fib[i-1]+fib[i-2]
#  if fib[i].to_s.size >= 1000
#    break
#  end
#  i += 1
#end
#p fib.size

f1 = 1
f2 = 2
f3 = 0
cnt = 3
loop do
  f3 = f2 + f1 
  break if f3 >= 10 ** 999
  f1 = f2
  f2 = f3
  cnt += 1
end
p cnt
