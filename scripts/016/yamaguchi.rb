sum = 0
(2**1000).to_s.each_byte{|byte| sum+=byte-48}
p sum