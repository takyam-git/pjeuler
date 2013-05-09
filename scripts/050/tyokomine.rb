# coding : utf-8
# 素数41は6つの連続する素数の和として表せる:
#
# 41 = 2 + 3 + 5 + 7 + 11 + 13.
# 100未満の素数を連続する素数の和で表したときにこれが最長になる.
#
# 同様に, 連続する素数の和で1000未満の素数を表したときに最長になるのは953で21項を持つ.
#
# 100万未満の素数を連続する素数の和で表したときに最長になるのはどの素数か?
require 'prime'

limit = 1_200_000 #max 
prime = 7 #開始位置
primes = Array.new
primes << 2
primes << 3
primes << 5
sums = Array.new
n = 0
loop do
  n += 1
  prime = 6*n + 1
  primes << prime if prime.prime?
  ans = primes.inject(0){|sum,n| sum+n}
  sums << ans if ans.prime?
  sums << ans-2 if (ans-2).prime?
  sums << ans-10 if (ans-10).prime?
  break if ans > limit
  prime += 4
  primes << prime if prime.prime?
  ans = primes.inject(0){|sum,n| sum+n}
  sums << ans if ans.prime?
  sums << ans-2 if (ans-2).prime?
  sums << ans-10 if (ans-10).prime?
  break if ans > limit
end
sums.each_with_index do |s,i|
  if s > 1_000_000
    p sums[i-1]
    break
  end
end
