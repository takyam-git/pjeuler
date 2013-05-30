sumup = 0
for n in 1 .. 1000
  tmp = 1
  n.times do 
    tmp *= n
    tmp = tmp % 10_000_000_000
    #p tmp
  end
  sumup += tmp
end

p sumup % 10_000_000_000

