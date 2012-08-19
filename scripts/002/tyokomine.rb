# coding: utf-8

fib = Array.new
fib[0]=1.to_i
fib[1]=2.to_i
sum = 2


(1..4000000).each do |i|
  n = i.to_i-1
  fib[n+2]=fib[n].to_i+fib[n+1].to_i
  if(fib[n+2].to_i%2==0)
    sum += fib[n+2].to_i
  end
  if sum > 4000000
    break
  end
end
p sum
