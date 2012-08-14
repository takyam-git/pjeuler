start = Time.now
def check_circuler(num)
  ary     = num.to_s.split(//)
  rev_ary = ary.reverse
  ary == rev_ary ? true : false
end

cnt = 0
max = 0

catch(:exit) {
  999.downto(1){|n1|
    throw :exit if n1 * 999 < max
    999.downto(n1){|n2|
      cnt += 1
      print  "#{n1}, #{n2}, #{n1*n2}\n"
      if check_circuler( n1 * n2 )
        max = n1 * n2
      end
    }
  }
}
p cnt
p max 
p ((Time.now - start) * 1000).round
