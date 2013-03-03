# coding : utf-8
# すべての桁に 1 から n が一度だけ使われている数をn桁の数が pandigital であるということにしよう: 例えば5桁の数 15234 は 1から5の pandigital である.
#
# 7254 は面白い性質を持っている. 39 × 186 = 7254 と書け, 掛けられる数, 掛ける数, 積が1から9の pandigital となる.
#
# 掛けられる数/掛ける数/積が1から9の pandigital となるような積の総和を求めよ.
#
# HINT: いくつかの積は, 1通り以上の掛けられる数/掛ける数/積の組み合わせを持つが1回だけ数え上げよ.
#

def is_pandigital?(n)
    check = Array.new(9,0)
    cnt = 0
    n.to_s.split('').each do |s|
        s = s.to_i
        return false if s == 0
        return false if check[s] == 1
        check[s] = 1
        cnt += 1
    end
    return true if cnt == 9
    return false
end

ans = 0
exist = Array.new
#2桁*3桁=4桁パターン
for i in 12..98
  for j in 123..987
    k = i*j
    next if k/10000 > 1
    str = i.to_s+j.to_s+k.to_s
    if is_pandigital?(str.to_i) && !exist.include?(k)
      ans += k 
      exist << k
    end
  end
end

#1桁*4桁=5桁パターン
for i in 1..9
  for j in 1234..9876
    k = i*j
    next if k/10000 > 1
    str = i.to_s+j.to_s+k.to_s
    ans += k if is_pandigital?(str.to_i)
  end
end
p ans


