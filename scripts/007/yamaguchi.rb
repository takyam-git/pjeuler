# Problem 7 †
#素数を小さい方から6つ並べると 2, 3, 5, 7, 11, 13 であり、6番目の素数は 13 である。
#
#10001 番目の素数を求めよ。
# 答えはWikipedia先生が知っていた！（Rubyのソース付きで）
# http://ja.wikipedia.org/wiki/%E3%83%9F%E3%83%A9%E3%83%BC-%E3%83%A9%E3%83%93%E3%83%B3%E7%B4%A0%E6%95%B0%E5%88%A4%E5%AE%9A%E6%B3%95

#今回は外部リソースに頼りまくった！自分のちからはほぼないｗ

#### ライブラリ利用パターン
require 'mathn'
i = 1
cnt = 0
while i += 1
  if Prime.instance.prime?(i)
    cnt += 1
    if cnt == 10001
      break
    end
  end
end
p i
exit

#### Wikipediaのコード利用パターン
#class Integer
#  def prime?
#    n = self.abs()
#    return true if n == 2
#    return false if n == 1 || n & 1 == 0
#    d = n-1
#    d >>= 1 while d & 1 == 0
#    20.times do                               # 20 は上の説明の k に相当
#      a = rand(n-2) + 1
#      t = d
#      y = ModMath.pow(a,t,n)                  # 実装コードは下にある
#      while t != n-1 && y != 1 && y != n-1
#        y = (y * y) % n
#        t <<= 1
#      end
#      return false if y != n-1 && t & 1 == 0
#    end
#    return true
#  end
#end
#
#module ModMath
#  def ModMath.pow(base, power, mod)
#    result = 1
#    while power > 0
#      result = (result * base) % mod if power & 1 == 1
#      base = (base * base) % mod
#      power >>= 1;
#    end
#    result
#  end
#end
#
#i = 0
#current_prime_index = 0
#while true
#  if i.prime?
#    current_prime_index += 1
#    break if current_prime_index >= 10001
#  end
#  i += 1
#end
#p i