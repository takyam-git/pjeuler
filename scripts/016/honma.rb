p((2**1000).to_s.each_byte.inject(0){|sum, byte| sum + byte - 48})
