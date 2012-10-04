# coding : utf-8

require 'date'
d = Date.today
s = Date.new(1900,1,1)
e = Date.new(2000,12,31)
result = 0
c = 0
loop do
  c += 1
  s = s + 1
  break if s == e
  if s >= Date.new(1901,1,1)
    if s.day==1 && c%7 == 1
      result += 1
    end
  end
end
p result
