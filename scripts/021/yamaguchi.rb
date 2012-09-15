#d(n)をnの真の約数の和と定義する。（真の約数とはn以外の約数のことである。）
#もし、d(a) = b かつ d(b) = a （a ≠ b）を満たすとき、aとbは友愛数（親和数）であるという。
#
#例えば、220の約数は1, 2, 4, 5, 10, 11, 20, 22, 44, 55, 110なのでd(220) = 284である。
#また、284の約数は1, 2, 4, 71, 142なのでd(284) = 220である。
#
#それでは10000未満の友愛数の合計を求めよ。

class Integer
  @@divisors_sum = {}
  def d
    sum = @@divisors_sum[self]
    return sum if !sum.nil?

    divisors  = [1]
    divisor = 2
    quotient = self / divisor
    while divisor < quotient
      if self % divisor == 0
        quotient = self / divisor
        divisors << divisor
        divisors << quotient
      end
      divisor += 1
    end
    sum = divisors.inject(&:+) || 0
    @@divisors_sum[self] = sum

    sum
  end
end

lovers = []
1.upto(9999) do |a|
  b = a.d
  next if b == 1 or a == b or a != b.d
  lovers << a
  lovers << b
end

p lovers.uniq.inject(&:+) #=>31626