num = [0, 1**5, 2**5, 3**5, 4**5, 5**5, 6**5, 7**5, 8**5, 9**5]
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

# 2桁 => 3^5 = 243
(1..2).each do |a|
  (0..2).each do |b|
    n = 10 * a + b
    @results << n if n == a ** 5 + b ** 5
  end
end
# 3桁 => 4^5 = 1024 4が1つで4桁になってしまうので0~3の組み合わせしかありえない
(1..3).each do |a|
  (0..3).each do |b|
    (0..3).each do |c|
      n = 100 * a + 10 * b + c
      @results << n if n == [a, b, c].inject(0){|s,n| s += num[n]}
    end
  end
end
# ここから下は、数字の入れ替えを省くロジックにする。
# 4桁 => 7^5 = 16807 7は1つで5桁になってしまう
(0..6).each do |a|
  s = [num[a]]
  (a .. 6).each do |b|
    s = s[0..0]
    s << num[b]
    (b .. 6).each do |c|
      s = s[0..1]
      s << num[c]
      (c .. 6).each do |d|
        s = s[0..2]
        s << num[d]
        next if (sum = s.inject(:+)) > 9999
        next if sum < 1000
        #p [a,b,c,d]
        #p sum
        chk(sum, [a,b,c,d])
      end
    end
  end
end

# 5桁 => 
(0..9).each do |a|
  s = [num[a]]
  (a .. 9).each do |b|
    s = s[0..0]
    s << num[b]
    (b .. 9).each do |c|
      s = s[0..1]
      s << num[c]
      (c .. 9).each do |d|
        s = s[0..2]
        s << num[d]
        (d .. 9).each do |e|
          s = s[0..3]
          s << num[e]
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

# 6桁 => 
(0..9).each do |a|
  s = [num[a]]
  (a .. 9).each do |b|
    s = s[0..0]
    s << num[b]
    (b .. 9).each do |c|
      s = s[0..1]
      s << num[c]
      (c .. 9).each do |d|
        s = s[0..2]
        s << num[d]
        (d .. 9).each do |e|
          s = s[0..3]
          s << num[e]
          (e .. 9).each do |f|
            s = s[0..4]
            s << num[f]
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

# 7桁 => 9^5 * 7 でも7桁にならない=存在しない

p @results.inject(:+)
#p @results
