limit = 1_000_000
minus = (1..9).to_a.inject(&:*)
ignore = limit / minus
numbers = (0..9).select{|number| number != ignore}
p (ignore.to_s + numbers.permutation.map{|num|num.join('').to_i}.sort[limit - minus * ignore - 1].to_s).to_i