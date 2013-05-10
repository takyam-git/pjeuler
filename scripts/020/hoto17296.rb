p (1..100).to_a.inject(:*).to_s.split(//).map{|s| s.to_i }.inject(:+)
