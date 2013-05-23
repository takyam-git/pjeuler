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

ansnum = 4_000_000 # 与件
@work_ansnum = ansnum * 2 + 1 # 上記の右辺に変形
@max_i = 1 # dの最大のindex
while (3 ** @max_i < @work_ansnum) do @max_i += 1 end

# [(2*1)+1, (2*1)+1, (2*1)+1, ..] (max_i個)から始める
# いったん昇順で
@work_idxs = Array.new

# ary が条件を満たすか再帰でcheckする
# aryと操作している桁を渡す
def aggr_cand(ary, now)
  #p "check:" + ary.to_s
  if decide_max_degit(ary) # falseで探索終了
    #p [ary.size, now, ary[now - 1], ary[now]]
    if (now < ary.size - 1 ) 
      #p ["next2i_digit",ary,now+1]
      aggr_cand(ary, ( now + 1) )
    end
    if (now == 0 || ( now > 0 && ( ary[now - 1] > ary[now] ) ) )
      work = ary.dup
      work[now] += 1
      #p ["next", work, now]
      aggr_cand(work, now)
    end
  end
end
def decide_max_degit(ary)
  work = ary.dup
  prd = work.inject(1){|prd, d| prd *= (2*d)+1 }
  max_degit = ( ( @work_ansnum / prd - 1 ) / 2 ).ceil + 1 # @work_ansnumを超えるには+1
  return false if max_degit < ary.max
  work.unshift(max_degit)
  #p work
  @work_idxs.push(work)
  return true
end

# 2^d は最小ではないでしょう。ということで1は確認しないcheat
# 一番大きいdは計算で求まる
(2 .. @max_i-1).to_a.reverse.each do |now_i| # dの配列[(2*1)+1, (2*1)+1, (2*1)+1, ..]の個数を減らしていく
  work = Array.new(now_i, 1) 
  aggr_cand(work,0)
end
#p @work_idxs


# 素数の配列
require 'prime'
primes = Array.new
pg = Prime::EratosthenesGenerator.new
@max_i.times do |p| primes.push(pg.next) end

# work_idxsを元にnの候補を計算
cand_n = Array.new
@work_idxs.each do |ary|
  tmp_n = 1
  ary.each_with_index do |d, i|
    tmp_n *= primes[i] ** d
  end
  cand_n.push(tmp_n)
end


# のうち最小のもの
#p cand_n
p cand_n.min









