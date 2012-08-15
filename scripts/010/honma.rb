# 10以下の素数の和は2 + 3 + 5 + 7 = 17である.
# 200万以下の全ての素数の和を計算しなさい.
def prime?(num, ary)
  ary.each do |n|
    break if n * n  > num
    return false if num % n == 0
  end
  return true
end
n = 0
prime_ary = [2, 3, 5]
while  prime_ary[-1] < 2_000_000
  n += 1
  prime = 6 * n + 1
  if prime?(prime, prime_ary)
    prime_ary.push(prime)
  end
  prime += 4
  if prime?(prime, prime_ary)
    prime_ary.push(prime)
  end
end
prime_ary.pop
p prime_ary.inject(:+)
