#Problem 52 「置換倍数」 †
#125874を2倍すると251748となる. これは元の数125874と順番は違うが同じ数を含む.
#
#2x, 3x, 4x, 5x, 6x が x と同じ数を含むような最小の正整数 x を求めよ.
q = (x,y)=>
  y = y.toString()
  for s in x
    return false if y.indexOf(s) < 0
  return true
x = 123456
while x++
  xs = x.toString()
  break if q(xs,x*6) and q(xs,x*5) and q(xs,x*4) and q(xs,x*3) and q(xs,x*2)
console.log(x)