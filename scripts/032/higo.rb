# 1桁 * 3桁 => 3~4桁 ->X
# 1桁 * 4桁 => 4~5桁
# 2桁 * 3桁 => 4~5桁
# 2桁 * 4桁 => 5桁以上->X
# 3桁 * 2桁 => 4~5
# 3桁 * 3桁 => 5桁以上->X
# 以上より、1digit * 4, 2 * 3, 3 * 2, 4 * 1のパターンのみ
# もっと早くできそうだけども。。。

@a = Array.new
@b = Array.new
@c = Array.new
def check(a, b, c) 
  if c == a * b then
    @a << a
    @b << b
    @c << c
  end
end

(1..9).to_a.permutation(9){ |ary|
  # 1 * 4
  check( ary[0], ary[1..4].join().to_i, ary[5..9].join().to_i)
  # 2 * 3
  check( ary[0..1].join().to_i, ary[2..4].join().to_i, ary[5..9].join().to_i)
  # 3 * 2
  check( ary[0..1].join().to_i, ary[2..4].join().to_i, ary[5..9].join().to_i)
  # 4 * 1
  check( ary[0..3].join().to_i, ary[4], ary[5..9].join().to_i)
}

#p @a
#p @b
#p @c

p @c.uniq.inject(:+)


