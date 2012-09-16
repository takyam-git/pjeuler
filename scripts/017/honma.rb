# 他と組み合わせない系
first = %w(one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen).map(&:length)
# 他と組み合わせる系
twent = %w(twenty thirty forty fifty sixty seventy eighty ninety ).map(&:length)
one = ([""] + %w( one two three four five six seven eight nine)).map(&:length)
hundredth = "hundred".length
hundred = "hundredand".length

number = 0
one.each do |hund|
  # 100, 200, 300, ...
  if hund != 0
    number += (hund + hundredth)
    hund = hund + hundred
  end

  # 1 ~ 19
  first.each do |fir|
    number += (hund + fir)
  end
  # 20 ~ 99
  twent.each do |twen|
    number += (hund + twen)
    first[0..8].each do |fir|
      number += (hund + twen + fir)
    end
  end
end
number += "onethousand".length
p number
