m = []
open("./matrix.txt"){|f|
	f.each.inject(0){|i,line|
		m[i] = []
		line.chomp.split(/,/).each.inject(0) {|k,num|
			m[i][k] = num.to_i
			k += 1
		}
		i += 1
	}
}

d = [[m[0][0]]]
79.times {|i|
	d[i+1] = [d[i][0] + m[i+1][0]]
	d[0][i+1] = d[0][i] + m[0][i+1]
}
m.each.inject(0){|i,l|
	l.each.inject(0){|k,n|
		if i !=0 && k!= 0
			if d[i-1][k]+m[i][k] < d[i][k-1]+m[i][k]
				d[i][k] = d[i-1][k]+m[i][k]
			elsif
				d[i][k] = d[i][k-1]+m[i][k]
			end
		end
		k +=1
	}
	i += 1
}

p d[79][79]

