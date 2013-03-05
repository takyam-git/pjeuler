
# 各gonの合計になりうる数字
# 全gonの合計は、外側のノードは1回、内側のノードは2回足される
possible_sums = Array.new
nums = (1..10).to_a
#
nums.to_a.combination(5).each do |a|
  b = (1..10).to_a - a
  possible_sums.push((a.inject(:+) + 2 * b.inject(:+))/5)
end
#p possible_sums.uniq!

ans = Array.new

@loop = 1
nums.to_a.combination(3).each do |a0|
  sum = a0.inject(:+)
  next if possible_sums.index(sum).nil?
  a0.permutation.each do |a1|
    # a1 = 1組目の候補
    gon1 = a1
    rest1 = nums - a1
    rest1.permutation(2).each do |a2|
      next if gon1[2] + a2.inject(:+) != sum
      # ここが2組目の候補
      rest2 = rest1 - a2
      gon2 = [ a2[0], gon1[2], a2[1] ]
      rest2.permutation(2).each do |a3|
        next if gon2[2] + a3.inject(:+) != sum
        # ここが3組目の候補
        rest3 = rest2 - a3
        gon3 = [a3[0], gon2[2], a3[1] ]
        rest3.permutation(2).each do |a4|
          next if gon3[2] + a4.inject(:+) != sum
          # ここが4組目の候補
          rest4 = rest3 - a4
          gon4 = [a4[0], gon3[2], a4[1]]
          # 5組目は自動で決まる
          gon5 = [rest4[0], gon4[2], gon1[1]]
          next if gon5.inject(:+) != sum
          @loop += 1
          next if [gon1[0], gon2[0], gon3[0], gon4[0], gon5[0]].min != gon1[0]
          ans.push([gon1.join.to_i, gon2.join.to_i, gon3.join.to_i, gon4.join.to_i, gon5.join.to_i])

        end
      end
    end
  end
end

#p ans.uniq
ans.uniq.sort.reverse.each do |a|
  n = a.join().to_i
  next if n > 10_000_000_000_000_000
  p n
  break
end

p @loop
