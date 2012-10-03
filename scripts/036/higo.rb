@kaibun = Array.new
def check(n)
  if n.to_s(2) == n.to_s(2).reverse
    @kaibun << n
  end
end

(1 .. 9).each do |n|
  check(n)
end
(1 .. 999).each do |n|
  # 偶数桁
  check( [n.to_s, n.to_s.reverse].join.to_i )
  # 奇数桁
  next if n > 99
  (0..9).each do |m|
    check( [n.to_s, m, n.to_s.reverse].join.to_i )
  end
end

p @kaibun.inject(:+)
