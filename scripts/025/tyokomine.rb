# encoding:utf-8

fib = Array.new
fib << 1
fib << 1
i=2
loop do
  fib[i]=fib[i-1]+fib[i-2]
  if fib[i].to_s.size >= 1000
    break
  end
  i += 1
end
p fib.size

