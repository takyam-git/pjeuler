# encoding : utf-8
# a + b > c なので c < 500
start = Time.now

a = b = c = 0
loop_cnt = 0
catch(:exit) do
  499.downto(1) do |cc|
    (1..((1000-cc)/2).to_i).each{|aa|
      loop_cnt += 1
      throw :exit if (a = aa) ** 2 + (b = 1000-aa-cc) ** 2 == (c = cc) ** 2
    }
  end
end
p a * b * c
print "loop_cnt: #{loop_cnt}\n"
print "took " + ((Time.now - start) * 1000).round.to_s + "ms.\n"

