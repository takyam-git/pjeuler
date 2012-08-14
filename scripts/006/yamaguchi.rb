# encoding: utf-8

num_a, num_b = 0, 0
1.upto(100){|num|
  num_a += num
  num_b += num * num
}
p (num_a * num_a) - num_b