
n = 1
def compare(org = Array, comp)
  if ( org <=> comp.to_s.split('').uniq.sort.to_a ) == 0
    #p [org, comp]
    return true
  end
  return false
end

while n += 1 do
  bits = Array.new
  bits = n.to_s.split('').uniq.sort.to_a
  flag = true
  (2..6).each do |i|
    unless compare(bits, n * i)
      flag = false
      break
    end
  end
  if flag == true
    p n
    exit
  end
end




