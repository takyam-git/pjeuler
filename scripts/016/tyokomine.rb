target = 1
for i in 1..1000
  target *= 2
end
p target
result = 0
p target.to_s.split('').inject(0){|sum,i|sum +i.to_i }

