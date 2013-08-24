#少数を分数にして返す
# http://ideone.com/oJS4W
decimal2fraction = (decimal)=>
  exponent = /^-?\d+\.(\d+)0*$/.exec(decimal).toString()[1].length
  denominator = Math.pow(10, exponent)
  numerator = decimal * denominator
  i = Math.min(Math.abs(denominator), Math.abs(numerator))
  while i > 1
    if denominator % i is 0 and numerator % i is 0
      denominator /= i
      numerator /= i
      break
    i--
  return [numerator, denominator]

#約分を行う(n分子、d分母）
yakubun = (n, d)=>
  bn = n
  bd = d
  m = Math.min(n,d)
  while m > 1
    if n % m  is 0 and d % m is 0
      n /= m
      d /= m
      break
    m--
  if bn isnt n and bd isnt d
    nd = yakubun(n,d)
    n = nd[0]
    d = nd[1]
  return [n, d]

#1〜9の左辺iと右辺nの組み合わせを作り、そこに1〜9のjを4種類の組み合わせを作る
answers = []
i = 0
while ++i < 10
  n = 0
  while ++n < 10
    #1を超える場合は無視
    continue if i >= n

    #1桁の時の演算結果
    x = i / n

    #左辺右辺にそれぞれ付与する数字j
    j = 0
    while ++j < 10
      #4種類の組み合わせを作る
      l1 = +"#{j}#{i}"
      r1 = +"#{j}#{n}"
      l2 = +"#{i}#{j}"
      r2 = +"#{n}#{j}"
      patterns = [[l1,r1], [l1,r2], [l2,r1], [l2,r2]]

      #各パターンで割り算してxと一致すればOK
      for pattern in patterns
        #1を超える場合は無視
        continue if pattern[0] >= pattern[1]
        y = pattern[0] / pattern[1]
        if y is x
          answers.push(x)
          break

#JSの浮動小数点は腐ってるので、分子と分母でそれぞれ積算する
n=1 #分子
d=1 #分母
for a in answers
  nd = decimal2fraction(a)
  n *= nd[0]
  d *= nd[1]

#分子と分母の績ができたら約分する
nd = yakubun(n,d)

#約分後のぶん後を結果として出力する
console.log(nd[1])