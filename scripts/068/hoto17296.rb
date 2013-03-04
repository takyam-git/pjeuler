# けっこうズルしたバージョン
res = []
sum = ((6..10).to_a.inject(:+) + (1..5).to_a.inject(:+)*2) / 5
(7..10).to_a.permutation do |n|
  n.unshift(6)
  (1..5).to_a.permutation do |m|
    next if n[0]+m[0]+m[1] != sum
    next if n[1]+m[1]+m[2] != sum
    next if n[2]+m[2]+m[3] != sum
    next if n[3]+m[3]+m[4] != sum
    next if n[4]+m[4]+m[0] != sum
    res.push("#{n[0]}#{m[0]}#{m[1]}#{n[1]}#{m[1]}#{m[2]}#{n[2]}#{m[2]}#{m[3]}#{n[3]}#{m[3]}#{m[4]}#{n[4]}#{m[4]}#{m[0]}".to_i)
  end
end
p res.max
