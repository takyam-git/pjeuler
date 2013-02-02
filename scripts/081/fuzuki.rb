m = Array.new(81,800000)#10000*80
m[1] = 0
open("./matrix.txt"){|f|
	f.each{|line|
		la = line.chomp.split(/,/)
		la.each.inject(1){|k,num|
			if(m[k] < m[k-1])
				m[k] = m[k] + num.to_i
			elsif
				m[k] = m[k-1] + num.to_i
			end
			k += 1
		}
	}
}
p m[80]

