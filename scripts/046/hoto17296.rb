
# 平方数
$squareNums = []

# 素数
$primeNums = [2]

# 素数判定
def is_prime (a)
  #return false if a == 1  # 1 は素数でない
  #return true  if a == 2  # 2 は素数
  return true  if a == 3  # 3 は素数
  int_limit = Math::sqrt(a).to_i
  flag = false
  2.upto( int_limit ) do |i|
    if a % i == 0
      flag = true
      break
    end
  end
  return !flag
end

# ゴールドバッハの予想通りかどうか
def goldbach? (n)
  $primeNums.each do |p|
    $squareNums.each do |s|
       m = p + s
       return true if m == n
       break if m > n
    end
  end
  return false
end

for n in 1..65536 do
  $squareNums << 2*n*n
  m = n*2+1
  if is_prime m
    $primeNums << m
  elsif !goldbach? m
    p m
    break
  end
end

