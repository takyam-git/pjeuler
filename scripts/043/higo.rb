
class Euler043
  attr_accessor :pan
  def initialize(n)
    @pan = n |= 0
    @prime = [nil, nil, 2, 3, 5, 7, 11, 13, 17]
  end
  def check_pan?(n = @pan)
    return true if n.to_s.split('').uniq.size == 10
    # NO-PAN
    return false
  end
  # return 3 digit that start from i-th
  def partial(i)
    return false if i > 8
    return @pan.to_s.split('')[(i-1)..(i+1)].join().to_i
  end
  # check partial can be devided by primes start from i-th
  def check_partial(i)
    return false if i > 8
    partial = partial(i)
    return true if (partial % @prime[i]).zero?
    return false
  end
  # omoshiroi?
  def omoshiroi?
    return false if ! self.check_pan?
    flg = true
    (2..8).each do |n|
      if ! self.check_partial(n)
        flg = false
        break
      end
    end
    return flg
  end
end

ans = Array.new
# 先頭1桁
(1..9).each do |i1|
  # 終わりの3ケタは17の倍数かつ3桁
  # 17 * 6 = 102
  # 17 * 58 = 986
  last3 = Array.new
  (6..58).each do |m|
    last3_int = 17 * m
    last3 = last3_int.to_s.split(//).map{|i|i.to_i}

    ary = (0..9).to_a - [i1] - last3
    
    ary.permutation do |rest|
      # 終わりの4桁目～2桁目は13の倍数
      next if [rest[-1], last3[0], last3[1]].join.to_i % 13 != 0
      # 4桁目は偶数
      next if rest[2] % 2 != 0
      pan = ([i1] + rest + last3).join.to_i
      eu = Euler043.new(pan)
      #p [pan, eu.omoshiroi?]
      ans.push(pan) if eu.omoshiroi?
    end
  end
end
p ans.inject(:+)
p ans
