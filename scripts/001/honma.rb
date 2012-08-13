#!/usr/bin/env ruby
def sum_select_inject (max, num1, num2)
  return (1..(max - 1)).select {|n|n % num1 == 0 || n % num2 == 0}.inject(&:+)
end
p sum_select_inject(1000, 3, 5)
