start = Time.now
require 'set'

@prime = Set.new [ 2, 3, 5, 7, 11, 13, 17, 19, 23, 29 ]
@funny = Array.new

## 素数の候補を返す。30で割った余りが以下のものが素数の候補
@pc = [1, 7, 11, 13, 17, 19, 23, 29, \
       31] #←繰り上がり対応用
def next_prime_candidate(now)
  return @prime.to_a[ @prime.to_a.index(now) + 1 ] if now < 29
  mod = now % 30
  return now - mod + @pc[ @pc.index(mod) + 1 ]
end

## 素数判定
def check_prime(n)
  return false if n <= 1
  return true if @prime.include?(n)
  @prime.each do |p|
    break if p * p > n
    return false if n % p == 0
  end
  @prime.add(n)
  return true
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
end

n = 2
loop do
  if ( check_prime(n) )
    #p n
    @funny << n if check_funny(n) && n > 10
    #p @funny
    break if @funny.size > 10
  end
  n = next_prime_candidate(n)
end

p @funny
p @funny.inject(:+)
print "took " + ((Time.now - start) * 1000).round.to_s + "ms.\n"
