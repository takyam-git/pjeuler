start = Time.now
cnt = 0
n = (1..9).to_a
palindromic_num = 0
# 3桁の数の積を大きい順に並べた配列を生成
ary1 = n.product([0, *n], [0, *n]).map {|a|a.join.to_i}.reverse
ary2 = Marshal.load(Marshal.dump(ary1))
catch(:finish) {
  ary1.each do |n|
    throw :finish if n * ary2[0] <= palindromic_num
    ary2.shift
    ary2.each do |m|
      cnt += 1
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
}
p palindromic_num
p "loop count:" + cnt.to_s
p "took " + ((Time.now - start) * 1000).round.to_s + "ms"
