require 'mathn'

@prime = Array.new
@notprime = Array.new
@funny = Array.new

def check_prime(n)
  return false if n < 1
  return true if @prime[n]
  return false if @notprime[n]
  if n.prime? 
    @prime[n] = true
    return true
  else
    @notprime[n] = true
    return false
  end
end

def check_funny(n)
  ary = n.to_s.split('')
  #puts "prime:"+n.to_s
  checkAry = Array.new
  check = 1
  (1..ary.size-1).each do |i|
    checkAry << ary[0..i-1].join.to_i
    checkAry << ary[-i..-1].join.to_i
  end
  #p checkAry
  checkAry.uniq.each do |n|
    return false if !check_prime(n)
  end
  #p n
end

## 素数の候補を返す。30で割った余りが以下のものが素数の候補
@pc = [1, 7, 11, 13, 17, 19, 23, 29, \
       31] #←繰り上がり対応用
def next_prime_candidate(now)
  mod = now % 30
  return now - mod + @pc[ @pc.index(mod) + 1 ]
end

# 5,7は該当しないので11からスタート
n = 11
loop do
  if ( check_prime(n) && ! @funny.index(n) )
    #p n
    @funny << n if check_funny(n)
    #p @funny
    break if @funny.size > 10
  end
  if n > 30
    n = next_prime_candidate(n)
  else
    n += 1
  end
end

p @funny
p @funny.inject(:+)
