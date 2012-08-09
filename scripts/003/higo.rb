a = ARGV[0] || 600851475143
factors = Array.new
divisor = 2 # start from 2
divided = a.to_i
while ( divisor <= divided ) do
  if (divided % divisor).zero? then 
    factors << divisor
    divided = divided / divisor
    next
  end
  divisor += 1
end

print "given number: ", a.to_s ,"\n"
print "factors: "
p factors
