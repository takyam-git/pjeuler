sumup = 0
(1..1000).to_a.each do |n|
  tmp = 1
  n.times do 
    tmp *= n
    tmp = tmp % 10_000_000_000
    #p tmp
  end
  sumup += tmp
end

p sumup % 10_000_000_000

