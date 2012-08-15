# 1~9の数字を使った3桁割る3桁の分数のうち1/2よりも小さくなるものの総数は全体の何％か？
# 順列(permutation)を使った方法
n = (1..9).to_a
all_ary = n.permutation(6).to_a
half_ary = all_ary.select{|ary| ary[0..2].join.to_i / ary[3..5].join.to_f < 0.5 }
print "%.2f" % ((half_ary.count / all_ary.count.to_f) * 100), "%\n"
