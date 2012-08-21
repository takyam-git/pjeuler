# encoding:utf-8
require 'mathn'

sum=0
for i in 1..2_000_000
  if i.prime?
    sum += i
  end
end
p sum
