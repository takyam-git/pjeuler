# encoding:utf-8
#
# 197は巡回素数と呼ばれる. 桁を回転させたときに得られる数 197, 971, 719 が全て素数だからである.
#
# 100未満には巡回素数が13個ある: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, および97である.
#
# 100万未満の巡回素数はいくつあるか?
require 'prime'

def is_prime_rotaion(n)
  n_to_s = n.to_s
  return false if (n >= 10 && n_to_s.index("2") || n_to_s.index("4") || n_to_s.index("6") || n_to_s.index("8") || n_to_s.index("0"))
  
  n_length = n_to_s.size
  str = n_to_s + n_to_s
  for i in 0..n_length-1
    return false if !str[i..n_length+i-1].to_i.prime?
  end
  return true
end

n=0
ans = 3 #2,3,5
loop do
  n+=1
  prime = 6*n+1
  break if prime > 1_000_000
  if prime.prime?
    ans += 1 if is_prime_rotaion(prime)
  end
  prime += 4
  break if prime > 1_000_000
 
  if prime.prime?
    ans += 1 if is_prime_rotaion(prime)
  end
end
p ans


