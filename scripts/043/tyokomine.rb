# coding : utf-8
# 数1406357289は0から9のPandigital数である (0から9が1度ずつ現れるので). この数は部分列が面白い性質を持っている.
#
# d1を1桁目, d2を2桁目の数とし, 以下順にdnを定義する. この記法を用いると次のことが分かる.
#
# d2d3d4=406は2で割り切れる
# d3d4d5=063は3で割り切れる
# d4d5d6=635は5で割り切れる
# d5d6d7=357は7で割り切れる
# d6d7d8=572は11で割り切れる
# d7d8d9=728は13で割り切れる
# d8d9d10=289は17で割り切れる
# このような性質をもつ0から9のPandigital数の総和を求めよ.
result = 0
nums = (0..9).to_a
nums.permutation(10){|n|
  next if (n[7].to_s+n[8].to_s+n[9].to_s).to_f % 17 != 0
  next if (n[6].to_s+n[7].to_s+n[8].to_s).to_f % 13 != 0
  next if (n[5].to_s+n[6].to_s+n[7].to_s).to_f % 11 != 0
  next if (n[4].to_s+n[5].to_s+n[6].to_s).to_f % 7 != 0
  next if (n[3].to_s+n[4].to_s+n[5].to_s).to_f % 5 != 0
  next if (n[2].to_s+n[3].to_s+n[4].to_s).to_f % 3 != 0
  next if (n[1].to_s+n[2].to_s+n[3].to_s).to_f % 2 != 0
  result += n.join().to_i
}
p result
