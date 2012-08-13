# encoding: utf-8

=begin
10未満の自然数で3か5の倍数のやつは3,5,6,9やろ。んで、こいつらの合計は29。
じゃぁ1000未満で3か5の倍数の合計を求めろや！！！やっほい！(・∀・)
=end

multiples_three = Array.new
multiples_five = Array.new

range = 1...1000
range.each do |i|
  multiples_three << i if i % 3 == 0
  multiples_five  << i if i % 5 == 0
end

# 3の倍数と5の倍数を結合
needs = multiples_three.concat(multiples_five)
# 重複分を破壊的メソッドでユニークに
needs.uniq!

sum = 0
needs.each do |num|
  sum += num
end

p sum