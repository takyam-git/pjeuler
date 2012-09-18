# encoding : utf-8
limit = 40
choice = limit/2
bunbo = 1
bunshi = 1
for i in (choice+1..limit)
  bunbo *= i
end
for i in 2..choice
  bunshi *= i
end
p bunbo/bunshi
