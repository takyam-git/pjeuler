# t = Time.now
# def prime?(num, ary)
#   ary.each do |n|
#     break if n * n  > num
#     return false if num % n == 0
#   end
#   return true
# end
def factorization (num)
  factor = []
  # prime_ary = [2, 3, 5]
  n = 0
  while true
    n += 1
    prime = 6 * n + 1
    break if prime * prime > num
    if num % prime == 0
      # prime_ary.push(prime)
      factor << prime
      num /= prime
    end
    prime += 4
    break if prime * prime > num
    if num % prime == 0
      # prime_ary.push(prime)
      factor << prime
      num /= prime
    end
  end
  factor << num
  return factor
end
p factorization(600851475143).max
# p Time.now - t
