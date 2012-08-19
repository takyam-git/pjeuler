# coding: utf-8

fib = Array.new
fib[0]=1
fib[1]=2
sum = 2


(1..4000000).each do |i|
  n = i.to_i-1
  fib[n+2]=fib[n]+fib[n+1]
  if fib[n+2]%2==0
    sum += fib[n+2]
  end
  if sum > 4000000
    break
  end
end
p sum
