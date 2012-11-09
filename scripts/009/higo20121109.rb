# 三角形なので a + b > c
# cを固定してa + b を探す
# cは500から減

500.downto(1) do |c|
  (1 .. ((1000-c)/2).to_i).each do |a|
    b = 1000 - c - a
    if a ** 2 + b ** 2 == c ** 2
      p [a, b, c].inject(:*)
      break
    end
  end
end

