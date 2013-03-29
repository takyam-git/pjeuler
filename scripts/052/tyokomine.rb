#coding : utf-8

def anagramu(base,n)
  n.split('').each do |e|
    return false if !base.include?(e)
  end
  return true
end

flag = false
for i in 123456..199999
  break if flag
  for j in 2..6
    break if !anagramu(i.to_s.split(''),(i*j).to_s)
    flag = true if j == 6
    p i if j == 6
  end
end

