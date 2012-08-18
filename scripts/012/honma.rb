require 'mathn'

def factorise (num)
  target = num
  factor_hash = Hash.new(0)
  # 荒い素数生成器を用いて素因数分解 => 遅い！
  # prime = Prime::Generator23.new

  # 6の倍数±1上にしか素数が存在しない法則を利用
  n = 2
  while true
    if target % n == 0
      factor_hash[n]+=1
      target /= n
    else
      break
    end
  end
  n = 3
  while true
    if target % n == 0
      factor_hash[n]+=1
      target /= n
    else
      break
    end
  end
  n = 5
  while true
    if target % n == 0
      factor_hash[n]+=1
      target /= n
    else
      break
    end
  end
  m = 1
  while true
    n = 6 * m + 1
    while true
      if target % n == 0
        factor_hash[n]+=1
        target /= n
      else
        break
      end
    end
    break if n * n >  target
    n += 4
    while true
      if target % n == 0
        factor_hash[n]+=1
        target /= n
      else
        break
      end
    end
    break if n * n >  target
    m += 1
  end
  factor_hash[target] += 1 if target > 1
  # p factor_hash
  return factor_hash
end

# 与えられた素因数分解の結果より約数の和を計算
def divisor_num(factor_hash)
  product = 1
  factor_hash.each do |key, value|
    product  *=  (value + 1)
  end
  return product
end

t = Time.now
# 三角数の行列の法則
triangul = 1
diff = 2
while true
  triangul += diff
  diff += 1
  break if divisor_num(factorise(triangul)) >= 501
end
p triangul
p Time.now - t
