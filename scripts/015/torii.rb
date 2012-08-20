# Starting in the top left corner of a 22 grid, there are 6 routes (without backtracking) to the bottom right corner.
# How many routes are there through a 2020 grid?

# 40 C 20

a = 40; b = 20
x = []
b.times {|i| x << (a - i)}
p x.inject(&:*) / (1..b).inject(&:*)
