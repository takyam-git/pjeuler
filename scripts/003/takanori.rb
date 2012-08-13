# encoding: utf-8
#
# Project Euler - Problem 3
#  13195 の素因数は 5、7、13、29 である。
#  600851475143 の素因数のうち最大のものを求めよ。
#
i = 600851475143
j = 2

while i > 1
    if i % j == 0
        i /= j
    else
        j += 1
    end
end

puts j
