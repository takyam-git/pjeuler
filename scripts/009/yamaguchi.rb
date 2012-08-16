#ピタゴラスの三つ組(ピタゴラスの定理を満たす自然数)とはa<b<cで
#a² + b² = c²
#を満たす数の組である.
#
#    例えば, 3² + 4² = 9 + 16 = 25 = 5²である.
#
#    a + b + c = 1000となるピタゴラスの三つ組が一つだけ存在する. このa,b,cの積を計算しなさい.
#
# http://1x4x9.net/2009/03/post-1082.html
# m>n
# mとnの和は奇数になる。
# という条件で、
# X = m^2 - n^2
# Y = 2 * m * n
# Z = m^2 + n^2
#start = Time.now
#cnt = 0
#1000.downto(1){|m|
#  (m-1).downto(1){|n|
#    cnt += 1
#    next if (m + n).even?
#    mm = m * m
#    nn = n * n
#    a = mm - nn
#    b = 2 * m * n
#    c = mm + nn
#    next if a + b + c != 1000
#    if a * a + b * b == c * c
#      p a * b * c
#      p cnt
#      p ((Time.now - start)*1000).round
#      exit
#    end
#  }
#}
# http://www004.upp.so-net.ne.jp/s_honma/pythagoras/pythagoras2.htm
#ピタゴラス数のある性質　　　　　　　　　　　　　　　　　
#
#　自然数 ａ、ｂ、ｃ が、ａ2＋ｂ2＝ｃ2 を満たすとき、ピタゴラス数といわれる。
#このような ａ、ｂ、ｃ は、
#
#　　　　　　ａ＝ｍ2－ｎ2　、　ｂ＝２ｍｎ　、　ｃ＝ｍ2＋ｎ2
#
#と書かれる。
#　ただし、ｍ、ｎ は、互いに素な自然数で、どちらかは偶数、かつ、ｍ＞ｎ とする。
#（詳しくは、こちらを参照）
#m*m - n*n + 2*m*n + m*m + n*n = 1000
#mm - nn + 2mn + mm + nn = 1000
# 2mm + 2mn = 1000
# mm + mn = 500
pita = 1000
half = (pita/2).to_i

#mの最大値+αは1000の半分の平方根以下
r = Math::sqrt(half).ceil.to_i
catch(:fin) do
  r.downto(1){|m|
    (m-1).downto(1){|n|
      next if !m.even? and !n.even?
      mm = m * m
      if mm + m*n == half
        nn = n * n
        p (mm-nn)*(2*m*n)*(mm+nn)
        throw :fin
      end
    }
  }
end
p 'not found'
