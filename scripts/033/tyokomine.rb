#49/98は面白い分数である.「分子と分母からそれぞれ9を取り除くと, 49/98 = 4/8 となり, 簡単な形にすることができる」と経験の浅い数学者が誤って思い込んでしまうかもしれないからである. (方法は正しくないが，49/98の場合にはたまたま正しい約分になってしまう．)
#
#我々は 30/50 = 3/5 のようなタイプは自明な例だとする.
#
#このような分数のうち, 1より小さく分子・分母がともに2桁の数になるような自明でないものは, 4個ある.
#
#その4個の分数の積が約分された形で与えられたとき, 分母の値を答えよ.

result = 1
for b in 11..99
  for a in 11..b
    next if a >= b
    as = a.to_s
    bs = b.to_s
    strArray = Array.new
    strArray << as.split('')
    strArray << bs.split('')
    next if !strArray[0].include?(strArray[1][0])
    newArray = strArray.flatten
    next if newArray.include?('0')
    if newArray.uniq.size == 3
      newArray.delete(newArray.group_by{|i| i}.reject{|k,v| v.one?}.keys[0])
    else
      newArray = newArray.uniq
    end
    if  newArray[0].to_f/newArray[1].to_f == a.to_f/b
      result *= Rational(a,b)
    end
  end
end
p result.denominator
