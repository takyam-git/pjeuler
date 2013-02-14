#Christian Goldbachは全ての奇合成数は平方数の2倍と素数の和で表せると予想した.
#
#9 = 7 + 2×12
#15 = 7 + 2×22
#21 = 3 + 2×32
#25 = 7 + 2×32
#27 = 19 + 2×22
#33 = 31 + 2×12
#
#後に, この予想は誤りであることが分かった.
#
#平方数の2倍と素数の和で表せない最小の奇合成数はいくつか?
require 'prime'

def is_true(n)
  max = ((Math::sqrt(n/2).ceil)).to_i+1
  max.downto(1){|i|
    if (n-(i**2)*2).prime?
      return true
    end
  }
  return false
end

n = 1
loop do
  n += 1
  next if n % 2 == 0
  next if n.prime?
  if !is_true(n)
    p n
    break
  end
end

