
n = 123456
def compare(org = Array, comp)
  if org == comp.to_s.split('').uniq.sort.to_a 
    #p [org, comp]
    return true
  end
  return false
end

while n += 1 do
  bits = n.to_s.split('').uniq.sort.to_a

  compare(bits, 2 * n) and 
    compare(bits, 3 * n) and
    compare(bits, 4 * n) and
    compare(bits, 5 * n) and
    compare(bits, 6 * n) and
    p n and break
end



