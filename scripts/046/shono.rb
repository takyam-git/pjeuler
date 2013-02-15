#!/usr/bin/env ruby

=begin

Problem 46 「平方数の2倍と素数の和で表せない最小の奇合成数はいくつか?」

Christian Goldbachは全ての奇合成数は平方数の2倍と素数の和で表せると予想した.

    9 = 7 + 2×12
    15 = 7 + 2×22
    21 = 3 + 2×32
    25 = 7 + 2×32
    27 = 19 + 2×22
    33 = 31 + 2×12

後に, この予想は誤りであることが分かった.

平方数の2倍と素数の和で表せない最小の奇合成数はいくつか?

=end

require 'prime'

i = 0
while 1 do
  i += 1
  next if not i > 1
  next if not i % 2 == 1
  next if Prime.prime?(i)

  f = false
  i.times do |j|
    next if not j > 0

    k = j * j * 2
    break if k >= i

    l = i - k
    f = true and break if Prime.prime?(l)
  end

  if not f
    puts i
    break
  end
end
