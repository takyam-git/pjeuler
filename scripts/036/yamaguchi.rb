#Problem 36 †
#585 = 10010010012 (2進) は10進でも2進でも回文数である.
#100万未満で10進でも2進でも回文数になるような数の総和を求めよ.
#(注: 先頭に0を含めて回文にすることは許されない.)
max = 1_000_000
sum = 0
1.upto(max) do |num|
  str_num = num.to_s
  next if str_num != str_num.reverse
  bin_num = num.to_s(2)
  sum += num if bin_num == bin_num.reverse
end
p sum