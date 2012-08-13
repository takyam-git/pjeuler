# encoding: utf-8
numbers = []
[3,5].each{|num|
  num.step(999,num){|n|
    numbers.push(n)
  }
}
p numbers.uniq.inject(0){|i,sum|sum+i}