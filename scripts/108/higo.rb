# n ( x + y ) = x * y
# x * y - n( x + y ) + n^2 = n^2
# ( x - n )( y - n ) = n^2
# よって、n^2の因数の数(重複除く)に等価
# かつ、x > n, y > n

# まず、奇数は因数が少ないので除外
# n = 2^d1 * 3^d2 * 5*d3 * ...
# n^2 = 2^(2*d1) * 3^(2*d2) * 5^(2*d3) * ...
# この時の因数の個数m は、((2*d1+1)*(2*d2+1)*(2*d3+1)*...)/2 (切り上げ)

# m > 1000
# (2*d1+1)*(2*d2+1)*(2*d3+1)*... > 2001
# を満たす組み合わせのうち最小のnを求める
# [d1, d2, d3, .. ]は降順に並ぶ
# dの最大のindexは、すべてのdが1のケース => 3^i > 2001となる最小のi

ansnum = 1000 # 与件
work_ansnum = ansnum * 2 + 1 # 上記の右辺に変形
max_i = 1 # dの最大のindex
while (3 ** max_i < work_ansnum) do max_i += 1 end

# [(2*1)+1, (2*1)+1, (2*1)+1, ..] (max_i個)から始める
# いったん昇順で
# 2^d は最小ではないでしょう。ということで1は確認しないcheat
work_idxs = Array.new
(2 .. max_i).to_a.each do |now_i| # dの配列[(2*1)+1, (2*1)+1, (2*1)+1, ..]の個数を減らしていく
  work = Array.new(now_i, 1) 
  while( work.inject(1){|prd, d| prd *= (2*d)+1 } < work_ansnum ) do
    work[work.index(work.min)] += 1
  end
  work_idxs.push(work.sort!.reverse)
end
#p work_idxs

# 素数の配列
require 'prime'
primes = Array.new
pg = Prime::EratosthenesGenerator.new
max_i.times do |p| primes.push(pg.next) end

# work_idxsを元にnの候補を計算
cand_n = Array.new
work_idxs.each do |ary|
  tmp_n = 1
  ary.each_with_index do |d, i|
    tmp_n *= primes[i] ** d
  end
  cand_n.push(tmp_n)
end

# のうち最小のもの
p cand_n.min









