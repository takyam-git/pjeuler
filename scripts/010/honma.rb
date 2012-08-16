# 10以下の素数の和は2 + 3 + 5 + 7 = 17である.
# 200万以下の全ての素数の和を計算しなさい.
max_num = 2_000_000
prime = Array.new(max_num, true)
prime[0] = false
# 素数の範囲は以下に限定される
(1..Math.sqrt(max_num).to_i).each do |i|
  # 導かれた素数で割り切れる数を消していく -- エラトステネスの篩
  if prime[i]
    ((i + 1)..(max_num / (i + 1).to_f).to_i).each do |j|
      prime[(i + 1)* j - 1] = false
    end
  end
end
sum = 0
(0..(max_num - 1)).each do |i|
  sum += (i + 1) if prime[i]
end
p sum
