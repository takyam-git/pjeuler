# encoding: utf-8
require 'prime'
num = 600851475143
renum = num
ans = 0
2.upto(num){|i|
  if i.prime? && renum % i == 0
   ans=renum/i
   break if ans.prime? || i*i>num
   renum = ans
  end
}
p ans

