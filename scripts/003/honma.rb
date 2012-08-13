def prime?(num, ary)
  ary.each do |n|
    break if n * n  > num
    return false if num % n == 0
  end
  return true
end
def factorization (num)
  factor = []
  prime_ary = [2, 3, 5]
  n = 0
  while  prime_ary.count < num
    n += 1
    prime = 6 * n + 1
    if prime?(prime, prime_ary)
      prime_ary.push(prime)
      factor << prime if num % prime == 0
      break if factor.inject(&:*)  == num
    end
    prime += 4
    if prime?(prime, prime_ary)
      prime_ary.push(prime)
      factor << prime if num % prime == 0
      break if factor.inject(&:*)  == num
    end
  end
  return factor
end
p factorization(600851475143).max
