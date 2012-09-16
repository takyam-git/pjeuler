# 素数を小さい方から6つ並べると 2,  3,  5,  7,  11,  13 であり、6番目の素数は 13 である。
# 10001 番目の素数を求めよ。
# ネットの情報と藤堂さんのコードを元にウルトラ爆速にしたった
n = 10001
max = n * Math::log(n) + n * Math::log( Math::log(n) )
max2 = (max-3)/2
for_end = Integer((Math.sqrt(max)-3)/2)
sieve = Array.new(max2, true)
# たぶん素数が存在する番号をここで計算している
for i in 0 .. for_end
  next unless sieve[i]
  k = i+i+3
  j = k*(i+1)+i
  while j <= max2
    sieve[j] = nil
    j += k
  end
end
for i in 0 .. max2
  sieve[i] && sieve[i]=i+i+3
end
sieve.compact!
sieve.unshift(2)
p sieve[n - 1]
