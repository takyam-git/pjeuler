require 'mathn'

@prime = Array.new
@notprime = Array.new
@cyclic = Array.new

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

def check_cyclic(n)
  ary = n.to_s.split('')
  #puts "prime:"+n.to_s
  cyclic = Array.new
  check = 1
  ary.each_with_index do |n,i|
    cand = Array.new
    l = ary.length
    0.upto(l-1) do |j|
      if i+j < l
        cand << ary[i+j]
      else
        cand << ary[i+j-l]
      end
    end
    m = cand.join.to_i
    cyclic << m
  end
  cyclic.each do |m|
    check = 0 if ! check_prime(m)
  end
  @cyclic += cyclic if check == 1
  #p @cyclic 
end

## 素数の候補を返す。30で割った余りが以下のものが素数の候補
@pc = [1, 7, 11, 13, 17, 19, 23, 29, \
       31] #←繰り上がり対応用
def next_prime_candidate(now)
  mod = now % 30
  return now - mod + @pc[ @pc.index(mod) + 1 ]
end

n = 2
while n < 1_000_000
  # 数字が1つでも偶数ならそれは循環素数になりえないので素数チェックもしない
  # 1ケタの素数は循環素数とするので通す
  # ary_check_evn
  ace = n.to_s.split('')
  if (n >= 10 && ace.index("2") || ace.index("4") || ace.index("6") || ace.index("8") || ace.index("0"))
    #puts "skip:" + n.to_s
  elsif ( check_prime(n) && ! @cyclic.index(n) )
    check_cyclic(n)
  end
  if n > 30
    n = next_prime_candidate(n)
  else
    n += 1
  end
end

p @cyclic
p @cyclic.uniq!.size()
