start = Time.now
cnt  = 0
last = 10001
num  = 2
$loop_cnt = 0

def check_prime(num)
  factor = 0
  (1..num).each{|n|
    factor += 1 if (num%n).zero?; $loop_cnt += 1; break if factor > 2
  }
end

while( cnt < last ) do
  cnt += 1 if check_prime(num)
  num += 1
end 

print "#{cnt}th prime number is #{num - 1}\n"
print "loop_cnt: #{$loop_cnt}\n"
print "took " + ((Time.now - start) * 1000).round.to_s + "ms.\n"
