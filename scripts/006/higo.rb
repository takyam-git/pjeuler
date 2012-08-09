p ((1..100).inject(0){|sum,n| sum += n})**2 - 
    (1..100).inject(0){|sum,n| sum += n**2}
