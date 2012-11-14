# 単位分数とは分子が1の分数である。分母が2から10の単位分数を10進数で表記すると次のようになる。
#
# 1/2 = 0.5
# 1/3 = 0.(3)
# 1/4 = 0.25
# 1/5 = 0.2
# 1/6 = 0.1(6)
# 1/7 = 0.(142857)
# 1/8 = 0.125
# 1/9 = 0.(1)
# 1/10 = 0.1
# 0.1(6)は 0.166666... という数字であり、1桁の循環節を持つ。1/7 の循環節は6桁ある。
#
# d < 1000 なる 1/d の中で循環節が最も長くなるような d を求めよ。
#
n = 1000
ans = 0
for i in 2..n
  next if n%i == 0 #1000を割り切れる数字は飛ばす
  num = (1000**1000/i).to_s
 # p '-----'
# p i,num
  exist = Array.new
  cnt = -2
  for j in 2..num.length
    break if exist.include?(num[j,5])#すでに含んでいる数であれば飛ばす
    if num[j,5] != 0
      exist << num[j,5]
    end
    cnt += 1
  end
  #p '-------'
  #p i,exist,cnt,num.length,num[j,5]
  if cnt > ans
    ans = i
  end
end
p ans
