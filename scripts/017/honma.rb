first = %w(one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
# 他と組み合わせる系
twent = %w(twent thirt fort fift sixt sevent eight ninet )
twent_end = %w(y y)
one = [""] + %w( one two three four five six seven eight nine)
hundredth = " hundred"
hundred = " hundred and "
number = []
one.each do |hund|
  # 100, 200, 300, ...
  if hund != ""
    number << hund + hundredth
    hund = hund + hundred
  end

  # 1 ~ 19
  first.each do |fir|
    number << hund + fir
  end
  # 20 ~ 99
  twent.each do |twen|
    number << hund + twen + twent_end[0]
    first[0..8].each do |fir|
      number << hund + twen + twent_end[1] + " " + fir
    end
  end
end
number << "one thousand"
# number.map{|n|p n}
p number.map{|n|n.gsub(/ /, "")}.map(&:length).inject(&:+)
