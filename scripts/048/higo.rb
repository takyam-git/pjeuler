sumup = 0
for n in 1 .. 1000
  sumup += n ** n
end

p sumup % 10_000_000_000

