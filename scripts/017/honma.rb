#!/usr/bin/env ruby
# encoding : utf-8
# Problem 17  †
# 1 から 5 までの数字を英単語で書けば one, two, three, four, five であり、全部で 3 + 3 + 5 + 4 + 4 = 19 の文字が使われている。
# では 1 から 1000 (one thousand) までの数字をすべて英単語で書けば、全部で何文字になるか。
# 注: 空白文字やハイフンを数えないこと。例えば、342 (three hundred and forty-two) は 23 文字、115 (one hundred and fifteen) は20文字と数える。なお、"and" を使用するのは英国の慣習。

# 他と組み合わせない系
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
