#require 'mathn'

### 素数
require 'set'
@prime = Array.new [ 2, 3, 5, 7, 11, 13, 17, 19, 23, 29 ]
## 素数の候補を返す。30で割った余りが以下のものが素数の候補
@pc = [1, 7, 11, 13, 17, 19, 23, 29, \
       31] #←繰り上がり対応用
def next_prime_candidate(now)
  return @prime[ @prime.index(now) + 1 ] if now < 29
  mod = now % 30
  return now - mod + @pc[ @pc.index(mod) + 1 ]
end
## 素数判定
def prime?(n)
  return false if n == 1
  return true if @prime.include?(n)
  # @primeをさらに伸ばす必要があるか
  #  =>@primeの最大の2乗を超える値をもらった時
  if n > @prime[-1] * @prime[-1]
    prime?(next_prime_candidate(n))
  end
  @prime.each do |p|
    break if p * p > n
    return false if n % p == 0
  end
  @prime.push(n)
  return true
end
###

def is_goldbach(n)
  #return if n.prime?
  max = Math.sqrt( n / 2 ).to_i
  max.downto(1) do |m|
    #p [m, (n - 2 * m * m)]
    return true if prime?( (n - 2 * m * m) )
  end
  return false
end

n = 33
loop do
  unless prime?(n)
    unless is_goldbach(n)
      p n
      break
    end
  end
  n += 2
end

