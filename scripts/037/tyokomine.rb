#coding : utf-8
#3797は面白い性質を持っている. まずそれ自身が素数であり, 左から右に桁を除いたときに全て素数になっている (3797, 797, 97, 7). 同様に右から左に桁を除いたときも全て素数である (3797, 379, 37, 3).
#
#右から切り詰めても左から切り詰めても素数になるような素数は11個しかない. 総和を求めよ.
#
#注: 2, 3, 5, 7を切り詰め可能な素数とは考えない.
#

require 'prime'

def fanc(n)
  str = n.to_s
  for i in 0..str.size-1
    return false if !str[0..i].to_i.prime?#左から一個ずつ
    return false if !str[str.size-1-i,i+1].to_i.prime?#右から一個ずつ
  end
  return true
end
ans_cnt = 0
ans = -7#7ひいとくよ
n = 0
loop do
  break if ans_cnt == 12#7があるので
  n += 1
  prime = 6*n+1
  if prime.prime?
    if fanc(prime)
      ans_cnt += 1
      ans += prime
    end
  end
  prime += 4
  if prime.prime?
    if fanc(prime)
      ans_cnt += 1
      ans += prime
    end
  end
end
p ans

