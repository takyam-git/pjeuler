min = 2
max = 100
numbers = []
min.upto(max) do |a|
  min.upto(max) do |b|
    numbers << a ** b
  end
end
p numbers.uniq.size