# coding : utf-8
#その4個の分数の積が約分された形で与えられたとき, 分母の値を答えよ.
#イギリスでは硬貨はポンド£とペンスpがあり，一般的に流通している硬貨は以下の8種類である.
#
#1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
#
#以下の方法で£2を作ることが可能である．
#
#1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p
#
#これらの硬貨を使って£2を作る方法は何通りあるか?

pences = Array.new
pences = [1,2,5,10,20,50,100,200]
ways = Array.new(201,0)
ways[0] = 1 
pences.each do |pence|
    for j in pence..200
        #penceで実現できる通りをどんどん足していく
        ways[j] += ways[j-pence]
    end
end
p ways[200]
