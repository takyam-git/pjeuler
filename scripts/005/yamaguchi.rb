# encoding: utf-8
#Problem 5 †
#2520 は 1 から 10 の数字の全ての整数で割り切れる数字であり、そのような数字の中では最小の値である。
#
#では、1 から 20 までの整数全てで割り切れる数字の中で最小の値はいくらになるか。
answer = 1
(1..20).to_a.each { |number| answer = answer * number / (answer.gcd(number)) }
p answer