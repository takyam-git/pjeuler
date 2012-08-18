# require 'mathn'

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
  # @factor_hash = Hash.new(0)
  @factor_hash.clear # ちょっとこっちの方が速い
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
    product  *=  (value + 1)
  end
  return product
end

# t = Time.now
# 三角数の行列の法則
triangul = 1
diff = 2
while true
  triangul += diff
  diff += 1
  next if triangul <  10_720_710 # 肥後さんの法則を利用
  # 約数の数が501以上なら終了
  break if divisor_num(factorise(triangul)) >= 501
end
p triangul
# p Time.now - t
