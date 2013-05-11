#!/usr/bin/env ruby
@prime_list = [2, 3, 5, 7, 11, 13, 17]
def factorise num
  ary = []
  @prime_list.each do |n|
    count = 0
    while num % n == 0
      count +=1
      num /= n
    end
    ary << count
  end
  ary
end
def divisor_num factor_ary
  num = 1
  factor_ary.each do |value|
    num *= (value + 1)
  end
  num
end
n = 2000
break if (divisor_num(factorise(n*n)) + 1) / 2 > 1000 while n += 2
p n
