#Problem 52 「置換倍数」 †
#125874を2倍すると251748となる. これは元の数125874と順番は違うが同じ数を含む.
#
#2x, 3x, 4x, 5x, 6x が x と同じ数を含むような最小の正整数 x を求めよ.
z = (x,y)=> return (x * y).toString().split('').sort().join() is x.toString().split('').sort().join()
x = 1
while x++
  break if z(x,2) and z(x,3) and z(x,4) and z(x, 5) and z(x, 6)
console.log(x)