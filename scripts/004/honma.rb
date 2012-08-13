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
