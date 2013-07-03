#coding: utf-8
#正の整数を順に連結して得られる以下の10進の無理数を考える:
#
#0.123456789101112131415161718192021...
#小数第12位は1である.
#
#dnで小数第n位の数を表す. d1 × d10 × d100 × d1000 × d10000 × d100000 × d1000000 を求めよ.

ans = Array.new
#6桁まででおｋ
for i in 1..2_000_00
  ans << i.to_s.split('')
end
ans.flatten!
p ans[0].to_i*ans[9].to_i*ans[99].to_i*ans[999].to_i*ans[9999].to_i*ans[99999].to_i*ans[999999].to_i


# 
# i = 0
# i_length = 0
# cnt = 0
# ans = 1
# loop do
#   i += 1
#   i_length += i.to_s.size
#   if i_length >= 10 && cnt == 0
#       cnt += 1
#       ans *= i.to_s[i_length-10,1].to_i
#       p cnt,ans,i.to_s,i.to_s[i_length-10,1]
#   elsif i_length >= 100 && cnt == 1
#       cnt += 1
#       ans *= i.to_s[i_length-100,1].to_i
#   elsif i_length >= 1000 && cnt == 2
#       cnt += 1
#       ans *= i.to_s[i_length-1000,1].to_i
#   elsif i_length >= 10000 && cnt == 3
#       cnt += 1
#       ans *= i.to_s[i_length-10000,1].to_i
#   elsif i_length >= 100000 && cnt == 4
#       cnt += 1
#       ans *= i.to_s[i_length-100000,1].to_i
#   end
#   break if i_length > 1_000_00
# end
# #p d[0,1].to_i*d[9,1].to_i*d[99,1].to_i*d[999,1].to_i*d[9999,1].to_i*d[99999,1].to_i*d[999999,1].to_i
# p ans
# 
# #p d[0,1].to_i*d[9,1].to_i*d[99,1].to_i*d[999,1].to_i*d[9999,1].to_i*d[99999,1].to_i
