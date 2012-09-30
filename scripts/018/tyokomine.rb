# encoding : utf-8
n='75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23'
n=n.gsub('\n',' ').split(' ')
n.map!{|x|x.to_i}
#方針としては直後何個かまで見て道を選択していくことにする
def max(a,b)
  if a>b
    return a
  else
    return b
  end
end

start=0 #起点の数字の配列インデックス
result=0
row=12
for i in 1..row
  rout1=n[start+i]+max(n[start+i+i+1],n[start+i+i+2])
  if(n[start+i+i+1]>n[start+1+1+2])
    rout1+=max(n[start+i+i+1+i+2],n[start+i+i+1+i+3])
  else
    rout1+=max(n[start+i+i+2+i+2],n[start+i+i+2+i+3])
  end

  rout2=n[start+i+1]+max(n[start+i+1+i+1],n[start+i+1+i+2])
  if(n[start+i+1+i+1]>n[start+i+1+i+2])
    rout2+=max(n[start+i+1+i+1+i+2],n[start+i+1+i+1+i+3])
  else
    rout2+=max(n[start+i+1+i+2+i+2],n[start+i+1+i+2+i+3])
  end
  result += n[start]
  if rout1>rout2
    if i==row
      result +=rout1
    end
    start=start+i
  else
    if i==row
      result += rout2
    end
    start=start+i+1
  end
end
p result
