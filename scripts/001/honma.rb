# p (1..999).select {|n|n % 3 == 0 || n % 5 == 0}.inject(&:+)
total = 0
(1..999).each{|n|total += n if n % 3 == 0 || n % 5 == 0}
p total
