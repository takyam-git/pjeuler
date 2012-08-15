# encoding: utf-8

# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.
# A. 233168

m = 1000; a1 = 3; a2 = 5
m = m - 1; a3 = a1 * a2; b1 = (m / a1).to_i; b2 = (m / a2).to_i; b3 = (m / a3).to_i
p (b1 * (b1 + 1) * a1 + b2 * (b2 + 1) * a2 - b3 * (b3 + 1) * a3) / 2
