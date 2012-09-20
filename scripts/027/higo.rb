@prime = Array.new
@notprime = Array.new
@max = 0
@maxat = []

class Fixnum
  def prime?
    n = self
    return false if n == 1
    m = Math.sqrt(n).to_i
    (2 .. m).each do |i|
      return false if (n % i).zero?
    end
    return true
  end
end

def check_prime(n)
  return false if n < 1
  return true if @prime.index(n)
  return false if @notprime.index(n)
  if n.prime? 
    @prime << n
    return true
  else
    @notprime << n
    return false
  end
end

def count_prime(a,b)
  cnt = 0
  n = 0
  loop do
    gotnum = n ** 2 + a * n + b
    break if ! check_prime( gotnum )
    cnt += 1
    n += 1
  end
  if cnt > @max 
    @max = cnt
    @maxat = [a,b]
  end
  #puts [a,b].to_s + ":" + cnt.to_s
end

999.downto(1) do |b|
  999.downto(1) do |a|
    (0 .. 0).each do |n| # 0から連続する？ことにする
      npapb = n ** 2 + a * n + b
      nmapb = n ** 2 - a * n + b
      npamb = n ** 2 + a * n - b
      nmamb = n ** 2 - a * n - b
      count_prime(a,b) if check_prime(npapb)
      count_prime(-a,b) if check_prime(nmapb)
      count_prime(a,-b) if check_prime(npamb)
      count_prime(-a,-b) if check_prime(nmamb)
    end
  end
end

p @maxat.inject(:*)
p @maxat
p @max
