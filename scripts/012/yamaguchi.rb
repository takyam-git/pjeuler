#三角数の数列は自然数の和で表わされ、7番目の三角数は 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28 である。 三角数の最初の10項は
#
#1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
#    となる。
#
#最初の7項について、その約数を列挙すると、以下のとおり。
#
#1: 1
#
#3: 1,3
#
#6: 1,2,3,6
#
#10: 1,2,5,10
#
#15: 1,3,5,15
#
#21: 1,3,7,21
#
#28: 1,2,4,7,14,28
#
#これから、7番目の三角数である28は、6個以上の約数をもつ最初の三角数であることが分る。
#
#では、501 個以上の約数をもつ最初の三角数はいくらか。
class Integer
  #素因数分解の結果を配列で返す
  def factorize
    factories = []
    return factories if self < 2
    #2で割ってく
    me,factories = self._get_factories(self, 2, factories)
    #奇数をひたすら割ってく
    num = 1
    step = 2
    while num+=step
      me,factories = self._get_factories(me, num, factories)
      break if me < num * num
    end
    #素数の場合最後に自身を追加
    factories << [me,1] if me > 1
    factories
  end

  def _get_factories(me, num, factories)
    cnt = 0
    while me % num == 0
      cnt+=1
      me=me/num
    end
    factories << [num,cnt] if cnt > 0
    return me,factories
  end
end

want = 501
step = 2
i = 1
while (i+=step)
  step+=1
  next if i < want
  vol = 1
  i.factorize.each{|fac|
    vol = vol * (fac[1]+1)
  }
  break if vol > want
end
p i