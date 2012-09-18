#!/usr/bin/env ruby
# encoding : utf-8
# Problem 23  †
# 完全数とは, その数の真の約数の和がそれ自身と一致する数のことである. たとえば, 28の真の約数の和は, 1 + 2 + 4 + 7 + 14 = 28であるので, 28は完全数である.
# 真の約数の和がその数よりも少ないものを不足数といい, 真の約数の和がその数よりも大きいものを過剰数と呼ぶ.
# 12は, 1+2+3+4+6=16となるので, 最小の過剰数である. よって2つの過剰数の和で書ける最少の数は24である. 数学的な解析により, 28123より大きい任意の整数は2つの過剰数の和で書けることが知られている. 2つの過剰数の和で表せない最大の数がこの上限よりも小さいことは分かっているのだが, この上限を減らすことが出来ていない.
# 2つの過剰数の和で書き表せない正の整数の総和を求めよ.
t = Time.now
@target = 0
@factor_hash = Hash.new(0)
# 与えられた数で割れるだけ割ってカウント
def factor (n)
  while true
    if @target % n == 0
      @factor_hash[n]+=1
      @target /= n
    else
      break
    end
  end
end

# 素因数分解
def factorise (num)
  return 0 if num == 1
  @target = num
  @factor_hash = Hash.new(0)
  # 荒い素数生成器を用いて素因数分解 => 遅い！
  # prime = Prime::Generator23.new

  # 6の倍数±1上にしか素数が存在しない法則を利用
  factor(2)
  factor(3)
  factor(5)
  m = 1
  while true
    n = 6 * m + 1
    break if n * n >  @target
    # 呼ぶと遅いのでfactor使わない
    while true
      if @target % n == 0
        @factor_hash[n]+=1
        @target /= n
      else
        break
      end
    end
    n += 4
    break if n * n >  @target
    # 呼ぶと遅いのでfactor使わない
    while true
      if @target % n == 0
        @factor_hash[n]+=1
        @target /= n
      else
        break
      end
    end
    m += 1
  end
  @factor_hash[@target] += 1 if @target > 1
  # p @factor_hash
  return @factor_hash
end

# 与えられた素因数分解の結果より約数の和を計算
def divisor_sum(factor_hash)
  return 0 if factor_hash == 0
  product = 1
  factor_hash.each do |key, value|
    s = 1
    value.times do |num|
      s += key ** (num + 1)
    end
    product  *= s
  end
  return product
end

def sum_of_two(n)
  @abundant.each do |i|
    # 過剰数の2倍が与えられた数よりも大きければそこで終了
    break if 2 * i > n
    # 与えられた数-過剰数が過剰数なら
    return true if @num_ary[n - i]
  end
  return false
end

sup = 28123
@num_ary = Array.new(sup + 1, false)
@abundant = []
(1..sup).each do |n|
  # 真でない約数の和を返しているので
  if divisor_sum(factorise(n)) > 2 * n
    @num_ary[n] = true
    @abundant << n
  end
end

sum = 0
(1..sup).each do |i|
  sum += i if !sum_of_two(i)
end
p sum
p Time.now - t
