@num = [1]
(1..9).each do |n|
  @num << @num[-1] * n
end
#[0!  1!  2!  3!  4!  5!   6!   7!    8!     9!    ]
#[1,  1,  2,  6,  24, 120, 720, 5040, 40320, 362880]

@results = []

# sumの各桁をnumsからdeleteしていってnullになったら一致する並びがあるということ
def chk(sum, nums)
  #p sum
  #p nums
  sum.to_s.split('').each do |str|
    idx = nums.index(str.to_i)
    nums.delete_at(idx) if ! idx.nil?
  end
  @results << sum if nums.empty?
end

# 1桁 ないのは自明

# 2桁 5以上は使えない
(0 .. 4).each do |a|
  s = [@num[a]]
  (a .. 4).each do |b|
    s = s[0..0]
    s << @num[b]
    next if (sum = s.inject(:+)) > 99
    next if sum < 10
    #p [a,b]
    #p sum
    chk(sum, [a,b])
  end
end

# 3桁 6は0or1回しか使えない
(0 .. 5).each do |a|
  s = [@num[a]]
  (a .. 5).each do |b|
    s = s[0..0]
    s << @num[b]
    (b .. 6).each do |c|
      s = s[0..1]
      s << @num[c]
      sum = s.inject(:+)
      next if sum > 999
      next if sum < 100
      #p [a,b,c]
      #p sum
      chk(sum, [a,b,c])
    end
  end
end

# 4桁 7は0or1回しか使えない
(0..6).each do |a|
  s = [@num[a]]
  (a .. 6).each do |b|
    s = s[0..0]
    s << @num[b]
    (b .. 6).each do |c|
      s = s[0..1]
      s << @num[c]
      (c .. 7).each do |d|
        s = s[0..2]
        s << @num[d]
        next if (sum = s.inject(:+)) > 9999
        next if sum < 1000
        #p [a,b,c,d]
        #p sum
        chk(sum, [a,b,c,d])
      end
    end
  end
end

# 5桁 => 8は0~2回 
(0..7).each do |a|
  s = [@num[a]]
  (a .. 7).each do |b|
    s = s[0..0]
    s << @num[b]
    (b .. 7).each do |c|
      s = s[0..1]
      s << @num[c]
      (c .. 8).each do |d|
        s = s[0..2]
        s << @num[d]
        (d .. 8).each do |e|
          s = s[0..3]
          s << @num[e]
          next if (sum = s.inject(:+)) > 99999
          next if sum < 10000
          #p [a,b,c,d,e]
          #p sum
          chk(sum, [a,b,c,d,e])
        end
      end
    end
  end
end

# 6桁 9は3回まで
(0..8).each do |a|
  s = [@num[a]]
  (a .. 8).each do |b|
    s = s[0..0]
    s << @num[b]
    (b .. 8).each do |c|
      s = s[0..1]
      s << @num[c]
      (c .. 9).each do |d|
        s = s[0..2]
        s << @num[d]
        (d .. 9).each do |e|
          s = s[0..3]
          s << @num[e]
          (e .. 9).each do |f|
            s = s[0..4]
            s << @num[f]
            next if (sum = s.inject(:+)) > 999999
            next if sum < 100000
            #p [a,b,c,d,e,f]
            #p sum
            chk(sum, [a,b,c,d,e,f])
          end
        end
      end
    end
  end
end

# 7桁
(0..8).each do |a|
  s = [@num[a]]
  (a .. 8).each do |b|
    s = s[0..0]
    s << @num[b]
    (b .. 8).each do |c|
      s = s[0..1]
      s << @num[c]
      (c .. 9).each do |d|
        s = s[0..2]
        s << @num[d]
        (d .. 9).each do |e|
          s = s[0..3]
          s << @num[e]
          (e .. 9).each do |f|
            s = s[0..4]
            s << @num[f]
            (f .. 9).each do |g|
              s = s[0..5]
              s << @num[g]
              next if (sum = s.inject(:+)) > 9999999
              next if sum < 1000000
              #p [a,b,c,d,e,f,g]
              #p sum
              chk(sum, [a,b,c,d,e,f,g])
            end
          end
        end
      end
    end
  end
end

p @results.inject(:+)
#p @results
