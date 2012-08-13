# 2520 は 1 から 10 の数字の全ての整数で割り切れる数字であり、そのような数字の中では最小の値である。
# では、1 から 20 までの整数全てで割り切れる数字の中で最小の値はいくらになるか。
# ワンライナーで書けるけど激遅！
# p 10.step(1/0.0, 10).each{|n| break n if (1..10).all?{|m|n%m==0}}.to_i
# p 20.step(1/0.0, 20).each{|n| break n if (1..20).all?{|m|n%m==0}}.to_i

# def dividable?(num, n)
#   return true if n == 2
#   return false if num % (n - 1) != 0
#   dividable?(num, n - 1)
# end
# n = 20
# while true
#   if dividable?(n, 20)
#     p n.to_i
#     break
#   end
#   n += 20
# end
# p ((Time.now - t)*1000).to_i # => 2秒程度

# ここまでやって実はRubyには最小公倍数を求めるメソッドがあってそれを使うと一瞬で求められることを発見orz
p (1..20).inject(1) {|result, n| result.lcm n}
