#単位分数とは分子が1の分数である。分母が2から10の単位分数を10進数で表記すると次のようになる。
#
#1/2 = 0.5
#1/3 = 0.(3)
#1/4 = 0.25
#1/5 = 0.2
#1/6 = 0.1(6)
#1/7 = 0.(142857)
#1/8 = 0.125
#1/9 = 0.(1)
#1/10 = 0.1
#0.1(6)は 0.166666... という数字であり、1桁の循環節を持つ。1/7 の循環節は6桁ある。
#
#d < 1000 なる 1/d の中で循環節が最も長くなるような d を求めよ。

require 'mathn'
limit = 1000
max = 0
max_num = 0
2.upto(limit) do |num|
  mnum = 1
  num.prime_division.each do |number, times|
    next if number == 2 or number == 5
    mnum *= number**times
  end
  next if mnum == 1

  cnt = 1
  cnt += 1 while 10 ** cnt % mnum != 1

  if cnt > max
    max = cnt
    max_num = num
  end
end

p max_num