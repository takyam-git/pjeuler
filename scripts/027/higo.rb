require 'mathn'

@prime = Array.new
@notprime = Array.new
@max = 0
@maxat = []

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

def count_prime(a,b)
  n = 0
  loop do
    gotnum = n ** 2 + a * n + b
    break if ! check_prime( gotnum )
    n += 1
  end
  if n > @max 
    @max = n
    @maxat = [a,b]
  end
  #puts [a,b].to_s + ":" + cnt.to_s
end

999.downto(1) do |b|
  999.downto(1) do |a|
    (0 .. 0).each do |n| # 0から連続する？ことにする
      count_prime(a,b)
      count_prime(-a,b)
      count_prime(a,-b)
      count_prime(-a,-b)
    end
  end
end

p @maxat.inject(:*)
p @maxat
#p @max
