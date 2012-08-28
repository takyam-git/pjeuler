# Starting in the top left corner of a 22 grid, there are 6 routes (without backtracking) to the bottom right corner.
# How many routes are there through a 2020 grid?

# 40 C 20

p (21..40).inject(&:*) / (1..20).inject(&:*)
