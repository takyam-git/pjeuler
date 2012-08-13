# 左右どちらから読んでも同じ値になる数を回文数という。 2桁の数の積で表される回文数のうち、最大のものは 9009 = 91 × 99 である。
# では、3桁の数の積で表される回文数のうち最大のものはいくらになるか。

# 2桁
# n = (1..9).to_a # => [1, 2, 3, 4, 5, 6, 7, 8, 9]
# # 2桁の数字を生成
# ary = n.product([0, *n]).map {|a|a.join.to_i}
# # 2桁 x 2桁のすべての組み合わせの積を大きい順に並べた中から回文数であるものを選択
# palindromic_ary = ary.product(ary).map {|a, b| a * b}.select do |n|
#   num_str = n.to_s
#   num_str == num_str.reverse
# end
# p palindromic_ary.max # => 9009

# 3桁
# 上のアルゴリズムだと1秒かかって遅いので別のアルゴリズムに変更
t = Time.now
n = (1..9).to_a
palindromic_num = 0
# 3桁の数の積を大きい順に並べた配列を生成
ary = n.product([0, *n], [0, *n]).map {|a|a.join.to_i}.reverse
ary.each do |n|
  ary.each do |m|
    # 見つけた回文数が現在のループの積よりも大きのなら意味ないのでbreak
    if palindromic_num >= n*m
      break
    end
    # 数字の文字列を反転させても同じなら回文数
    num_str = (n*m).to_s
    if num_str == num_str.reverse
      palindromic_num = n*m
      break
    end
  end
end
p palindromic_num
p ((Time.now - t) * 1000).round