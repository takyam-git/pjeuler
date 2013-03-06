l = 0
mult = 1
(1..1000000).to_a.each do |n|
  n = n.to_s
  before_l = l.to_s.length
  l += n.length
  after_l = l.to_s.length

  if after_l - before_l > 0
    idx = n.length - (l - (10**before_l)) - 1
    n = n.split(//)
    break if before_l==6
    mult *= n[idx].to_i
  end
end

p mult
