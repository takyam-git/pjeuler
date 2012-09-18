#完全数とは, その数の真の約数の和がそれ自身と一致する数のことである. たとえば, 28の真の約数の和は, 1 + 2 + 4 + 7 + 14 = 28であるので, 28は完全数である.
#
# 真の約数の和がその数よりも少ないものを不足数といい, 真の約数の和がその数よりも大きいものを過剰数と呼ぶ.
#
# 12は, 1+2+3+4+6=16となるので, 最小の過剰数である. よって2つの過剰数の和で書ける最少の数は24である. 数学的な解析により, 28123より大きい任意の整数は2つの過剰数の和で書けることが知られている. 2つの過剰数の和で表せない最大の数がこの上限よりも小さいことは分かっているのだが, この上限を減らすことが出来ていない.
#
# 2つの過剰数の和で書き表せない正の整数の総和を求めよ.
require 'mathn'
class Integer
  @@divisors_sum = {}
  def d
    sum = @@divisors_sum[self]
    return sum if !sum.nil?
    sum =1
    self.prime_division.each do |num, times|
      sum *= (0..times).inject(0){|sum,p|sum+=num**p}
    end
    sum = sum -self
    @@divisors_sum[self] = sum
    return sum
  end
end

flags = [false]
abs = []
1.upto(28123) do |num|
  d = num.d
  flag = (d > num)
  flags << flag
  abs << num if flag
end
sum = 0
1.upto(28123) do |num|
  catch(:search) do
    abs.each do |ab|
      key = num - ab
      next if key < 0
      throw :search if flags[key]
    end
    sum += num
  end
end

p sum #=> 4179871