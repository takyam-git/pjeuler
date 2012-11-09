#辺の長さが{a,b,c}と整数の3つ組である直角三角形を考え, その周囲の長さをpとする. p = 120のときには3つの解が存在する:
#
#{20,48,52}, {24,45,51}, {30,40,50}
#p ≦ 1000 で解の数が最大になる p を求めよ.

ans = Array.new
for a in 1..999
  for b in 1..999
     c = Math.hypot(a,b)
     break if a+b+c>1000
     p_num = a+b+c
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
ans.each_with_index do |e,i|
 if e != nil
  if max < e
   max = e
   result = i
  end
 end
end
p result
