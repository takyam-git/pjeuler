start = Time.now
# 約数の数は素因数分解した組み合わせ数
# n = 2^2 * 3^2 * 5^1 * 7*1
#   => (2+1) * (2+1) * (1+1) * (1+1)
#
# higo改
# 絶対にありえない範囲を調べない
# 約数が500を超えると考えると、、、
# 500 > (1+1)^8
#   => 2 * 3 * 5 * 7 * 11 * 13 * 17 * 21 = 10_720_710
# つまりこれより小は調べる必要なし
low = 10_720_710
now = 0
idx = 1
$loop_cnt = 0

## 素数の候補を返す。30で割った余りが以下のものが素数の候補
@pc = [1, 7, 11, 13, 17, 19, 23, 29, \
       31] #←繰り上がり対応用
def next_prime_candidate(now)
  mod = now % 30
  now - mod + @pc[ @pc.index(mod) + 1 ]
end
## 素因数分解したhashを返す
def factorial_hash(num)
  factors = Hash.new(0)
  # 小さい素数は予め与えておく。それ以上はnext_prime_candidate
  divisor_pre = [ 2, 3, 5, 7 ]
  divisor = divisor_pre.shift # start from 2
  divided = num.to_i
  # 平方根まで調べればOK。その代わりに最後にdividedをカウント
  while ( divisor ** 2 <= divided ) do
    $loop_cnt += 1
    if (divided % divisor) == 0 then
      factors[divisor] += 1
      divided = divided / divisor
      next
    end
    divisor = divisor_pre.empty? \
            ? next_prime_candidate(divisor) \
            : divisor_pre.shift
  end
  factors[divided] += 1
  return factors
end

loop do 
  now += idx
  if now > low then
    hash = factorial_hash(now)
    #p hash
    factors_num = hash.inject(1){|prod, (key, val)| prod *= (val + 1)}
    #p factors_num
    break if factors_num > 500
  end
  idx += 1
end

p now
print "loop_cnt: #{$loop_cnt}\n"
print "took " + ((Time.now - start) * 1000).round.to_s + "ms.\n"
