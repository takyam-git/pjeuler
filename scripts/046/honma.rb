#!/usr/bin/env ruby
# coding : utf-8
require 'prime'
# @m = 0
# def under_prime n
#   if @prime_ary[-1] >= n
#     ary = []
#     m = 0
#     while @prime_ary[m] < n
#       print @prime_ary[m].to_s + " "
#       ary.push @prime_ary[m]
#       m += 1
#     end
#     return ary
#   end
#   while true
#     @m += 1
#     prime = 6 * @m + 1
#     if prime?(prime)
#       @prime_ary.push(prime)
#       if prime > n
#         break
#       end
#     end
#     prime += 4
#     if prime?(prime)
#       @prime_ary.push(prime)
#       if prime > n
#         break
#       end
#     end
#   end
#   return @prime_ary
# end

@prime_ary = [2, 3, 5]
def prime?(num)
  @prime_ary.each do |n|
    break if n * n  > num
    return false if num % n == 0
  end
  @prime_ary.push(num)
  return true
end

# def goldbach? n
#   (1..n/2.to_i).each do |i|
#     if prime? n-(i**2)*2
#       return true
#     end
#   end
#   return false
# end
def is_true(n)
  max = ((Math::sqrt(n/2).ceil)).to_i+1
  max.downto(1){|i|
    if (n-(i**2)*2).prime?
    # if @prime_ary.include?(n-(i**2)*2)
    # if prime? (n-(i**2)*2)
      return true
    end
  }
  return false
end

n = 1
loop do
  n += 2
  # next if n.prime?
  next if prime? n
  if !is_true(n)
    p n
    break
  end
end
