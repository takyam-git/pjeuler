#! ruby -Kui
limit = 1000
sum=0;
(1..limit-1).each do |i|
  if(i%3==0 || i%5==0)
    sum += i
  end
end
p sum
