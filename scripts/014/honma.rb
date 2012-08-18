# Problem 14  †
# 正の整数に以下の式で繰り返し生成する数列を定義する。
# n → n/2 (n が偶数)
# n → 3n + 1 (n が奇数)
# 13からはじめるとこの数列は以下のようになる。
# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
# 13から1まで10個の項になる。
# この数列はどのような数字からはじめても最終的には 1 になると考えられているが、まだそのことは証明されていない(コラッツ問題)
# さて、100万未満の数字の中でどの数字からはじめれば一番長い数列を生成するか。
# 注意: 数列の途中で100万以上になってもよい
# require "pp"
# t = Time.now
@answer = 0
@max = 0
@collatz = Hash.new(1)
def collatz_seriese (n)
  seriese = n
  while seriese != 1
    if seriese % 2 == 0
      seriese /= 2
    else
      seriese =  3 * seriese + 1
    end
    if @collatz[seriese] > 1
      @collatz[n] += @collatz[seriese]
      return
    end
    @collatz[n] += 1
  end
ensure
  if @max < @collatz[n]
    @max = @collatz[n]
    @answer = n
  end
end
(2..999_999).each do |num|
  collatz_seriese(num)
end
# pp @collatz
p @answer
# p Time.now  - t
