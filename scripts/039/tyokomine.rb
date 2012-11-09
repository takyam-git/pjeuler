#辺の長さが{a,b,c}と整数の3つ組である直角三角形を考え, その周囲の長さをpとする. p = 120のときには3つの解が存在する:
#
#{20,48,52}, {24,45,51}, {30,40,50}
#p ≦ 1000 で解の数が最大になる p を求めよ.

ans = Array.new
for a in 1..334
  for b in a+1..600
     c = Math.hypot(a,b)
     break if a+b+c>1000
     p_num = a+b+c
     #cが整数のときは直角
     if c == c.to_i
       if ans[p_num] == nil
         ans[p_num] = 1
       else
         ans[p_num] = ans[p_num]+1
       end
     end
  end
end
max=0
result = 0
#配列バージョン
ans.each_with_index do |e,i|
 if e != nil
  if max < e
   max = e
   result = i
  end
 end
end
#ハッシュバージョン
#ans.each{|key,value|
#  if max < value
#    max = value
#    result = key
#  end
#}
p result
