#Problem 31 †
#イギリスでは硬貨はポンド£とペンスpがあり，一般的に流通している硬貨は以下の8種類である.
#
#    1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
#
#以下の方法で£2を作ることが可能である．
#
#1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p
#
#これらの硬貨を使って£2を作る方法は何通りあるか?

# http://pamgau.net/item/700　←ここ参考にしました

#target = 200
#ways = Array.new(target+1,0)
#ways[0] = 1
#[1,2,5,10,20,50,100,200].each do |coin|
#  (coin..target).each do |pay|
#    ways[pay] += ways[pay - coin]
#  end
#end
#p ways[target]

