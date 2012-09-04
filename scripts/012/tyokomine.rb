# encoding:utf-8
limit = 501
i=0
sankaku=0
loop do 
  i += 1
  sankaku += i
  next if sankaku < 10_720_710 #肥後則
  yaku = 0
  b=0
  (1..sankaku).each do |s|
    if sankaku % s == 0
      break if s*b >= sankaku
      yaku += 2
      b = s
    end
  end
  break if yaku >= limit
end
p sankaku
