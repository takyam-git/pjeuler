p (1..100).inject(&:*).to_s.split(//).map{|s|s.to_i}.inject(&:+)
