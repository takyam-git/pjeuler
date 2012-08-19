# coding: utf-8

fib = Array.new
fib[0]=1.to_i
fib[1]=2.to_i
sum = 0


(1..4000000).each do |i|
  sum=0
  n = i.to_i-1
  fib[n+2]=fib[n].to_i+fib[n+1].to_i
  fib.each do |f|
    if(f.to_i%2==0)
     sum += f.to_i
    end
  end
  if sum > 4000000
    break
  end
end
p sum
