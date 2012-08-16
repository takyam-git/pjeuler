# 10以下の素数の和は2 + 3 + 5 + 7 = 17である.
# 200万以下の全ての素数の和を計算しなさい.
max = 2_000_000
# 山口さんのソースを元に高速化
#3～maxの奇数のみの配列を作る
numbers = 3.step(max, 2).to_a
numbers_size = numbers.size
#配列を回す
numbers.each_with_index{|number, index|
  next if !number #nilならskip
  next_index = index
  #倍数のものをnilにしていく
  while true
    next_index += number
    break if next_index >= numbers_size
    numbers[next_index] = nil
  end
}

#配列に2を加えて合計する
p numbers.unshift(2).compact!.inject(&:+)
