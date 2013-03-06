p (1..100).to_a.inject(1){|r, i| r * i}.to_s.split(//).map{|s| s.to_i }.inject(:+)
