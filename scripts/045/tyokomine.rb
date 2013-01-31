#coding:utf-8
#三角数, 五角数, 六角数は以下のように生成される.
#
#三角数 Tn=n(n+1)/2 1, 3, 6, 10, 15, ...
#五角数 Pn=n(3n-1)/2  1, 5, 12, 22, 35, ...
#六角数 Hn=n(2n-1)  1, 6, 15, 28, 45, ...
#T285 = P165 = H143 = 40755であることが分かる.
#
#次の三角数かつ五角数かつ六角数な数を求めよ.

def is_five(n)
  ans = (Math::sqrt(n*24+1)+1)/6 
  if ans == ans.to_i 
    return true
  else
    return false
  end
end

def is_three(n)
  ans = (Math::sqrt(n*8+1)-1)/2
  if ans == ans.to_i 
    return true
  else
    return false
  end
end

n = 143
loop do
  n += 1
  i = n*(2*n-1)
  if is_five(i) && is_three(i)
    p i
    break
  end
end

