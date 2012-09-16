#!/usr/bin/env ruby
# coding : utf-8

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
def divisor_num(factor_hash)
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

def yuai?(num)
  num_factor_sum = divisor_num(factorise(num)) - num
  return false if num == num_factor_sum
  num == divisor_num(factorise(num_factor_sum)) - num_factor_sum
end
# p (1..9999).inject(0){|sum, n|yuai?(n) ? sum + n : sum}
# p((1..999).select{|n| yuai?(n)})
p((2..9999).select{|n| yuai?(n)}.inject(:+))
