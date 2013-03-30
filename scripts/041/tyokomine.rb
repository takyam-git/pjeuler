#coding: utf-8
#n桁Pandigitalであるとは, 1からnまでの数を各桁に1つずつ持つこととする.
##下のリンク先にあるような数学的定義とは異なる
#例えば2143は4桁Pandigital数であり, かつ素数である. n桁（この問題の定義では9桁以下）Pandigitalな素数の中で最大の数を答えよ.
require 'prime'
=begin
def pandigital?(n)
  str = n.to_s.split('')
  tmp = Array.new(str.size,0)
  str.each do |s|
    return false if s == "0"
    return false if s.to_i > str.size
    return false if tmp[s.to_i] == 1
    tmp[s.to_i] = 1
  end
  p n
  return true
end
=end
flag = false
9.downto(1) do |i|
  numbers = (1..i).to_a.reverse
  numbers.permutation(i){|n|
    if n[i-1]%2 == 1
      num = n.join().to_i
      if num.prime?
        p num
        flag = true
        break
      end
    end
  }
  break if flag
end

=begin
このアプローチは時間かかりすぎる。。
1-9までの数字の順列で見て(ひとけた目9固定でいいかも)
それが素数かどうか判定するように作り変える。

987654321.downto(900000000) do |n|
  if pandigital?(n) && n.prime?
    p n
    break
  end
end
=end
