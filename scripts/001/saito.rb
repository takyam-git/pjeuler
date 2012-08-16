module Problem1Module
  def calc(n)
    sum = 0

    n.times do |i|
      sum += i if (i%3 == 0 || i%5 == 0)
    end

    return sum
  end
end

class OutputClass
  include Problem1Module
  extend  Problem1Module
end

#As a class method
p OutputClass.calc(1000)

