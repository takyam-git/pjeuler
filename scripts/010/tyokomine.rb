# encoding:utf-8
require 'prime'

sum=2+3+5
max = 2_000_000
for i in 1..max/6
  prime = i*6+1
  if prime > max
    break
  end
  if prime.prime?
    sum += prime
  end

  prime += 4
  if prime > max
    break
  end

  if prime.prime?
    sum += prime
  end
end
p sum
