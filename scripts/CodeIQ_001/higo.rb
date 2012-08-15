# encoding: utf-8
start = Time.now

case_cnt = 0
cnt = 0

(1..9).each do |a|
  a2 = Array.new
  (1..9).each {|i| a2 << i if i != a}
  a2.each do |b|
    a3 = Array.new
    (1..9).each {|i| a3 << i if i != a and i != b}
    a3.each do |c|
      a4 = Array.new
      (1..9).each {|i| a4 << i if i != a and i != b and i != c}
      a4.each do |d|
        a5 = Array.new
        (1..9).each {|i| a5 << i if i != a and i != b and i != c and i != d}
        a5.each do |e|
          a6 = Array.new
          (1..9).each {|i| a6 << i if i != a and i != b and i !=c and i != d and i != e}
          a6.each do |f|
            case_cnt += 1
            child  = 100*a + 10*b + c
            parent = 100*d + 10*e + f
            #p child.to_s + "/" + parent.to_s
            cnt += 1 if child.to_f / parent.to_f < 0.5
          end
        end
      end
    end
  end
end

printf "%2.2f \%\n",  ( cnt.to_f / case_cnt.to_f * 100 )
#print "case: " + case_cnt.to_s + " count: " + cnt.to_s + "\n"
#print "took " + ((Time.now - start) * 1000).round.to_s + "ms.\n"

