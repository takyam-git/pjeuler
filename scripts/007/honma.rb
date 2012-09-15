# 素数を小さい方から6つ並べると 2,  3,  5,  7,  11,  13 であり、6番目の素数は 13 である。
# 10001 番目の素数を求めよ。
class HOMMA_PROBREM_007
  max = Integer(ARGV.shift || 10001)
  def self.prime?(num, ary)
    ary.each do |n|
      break if n * n  > num
      return false if num % n == 0
    end
    return true
  end
  n = 0
  prime_ary = [2, 3, 5]
  while  prime_ary.count < max
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
  p prime_ary[-1]
end
