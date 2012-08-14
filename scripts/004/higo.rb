start = Time.now
def check_circuler(num)
  num.to_s == num.to_s.reverse ? true : false
end

cnt = 0
max = 0

catch(:exit) {
  999.downto(1){|n1|
    throw :exit if n1 * 999 < max
    999.downto(n1){|n2|
      cnt += 1
#      print  "#{n1}, #{n2}, #{n1*n2}\n"
      if check_circuler( n1 * n2 )
        max = n1 * n2
      end
    }
  }
}
p max
p "loop count:" + cnt.to_s
p "took " + ((Time.now - start) * 1000).round.to_s + "ms"
