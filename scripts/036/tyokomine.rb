# encoding:utf-8
result = 0
(1..1_000_000).each do |i|
  s = i.to_s
  if s==s.reverse 
    s2 = i.to_s(2)
    if s2==s2.reverse
      result += i
    end
  end
end
p result

