require 'prime'
primes = Prime.each(10000).to_a - Prime.each(1000).to_a
size = primes.size
catch(:end) do
primes.each_index do |i|
  (i+1 .. size-1).each do |j|
    pi = primes[i]
    pj = primes[j]
    #p [i,j,pi,pj]
    diff = pj - pi
    break if ( pk = pj + diff ) > 10000
    #if primes.index(pk)
    if pk.prime?
      if ( pi.to_s.split('').sort == pj.to_s.split('').sort && 
           pi.to_s.split('').sort == pk.to_s.split('').sort )
        p (pi.to_s + pj.to_s + pk.to_s).to_i if pi != 1487
        throw :end if pi != 1487
      end
    end
  end
end
end
