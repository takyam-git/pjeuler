require 'prime'

cnt = 0
n = 210 # 2*3*5*7

while cnt < 4
  if n.prime_division.map{|ary|ary[0]}.size >= 4
    cnt += 1 
    #p [cnt,n]
  else
    cnt = 0
  end
  n += 1
end
p n - 4


