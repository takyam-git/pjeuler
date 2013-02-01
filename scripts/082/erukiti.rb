#! ruby
# coding: utf-8

if true
$matrix = []
lines = 0
IO.read("matrix.txt").each_line do |line|
  $matrix += line.strip.split(',').map {|num| num.strip.to_i}
  lines += 1
end

WIDTH = $matrix.size / lines
MAX_X = $matrix.size / lines - 1
MAX_Y = lines - 1

else
$matrix = 
[
  131,	673, 234,	103,	18,
  201,	96,	 342,	965,	150,
  630,	803, 746,	422,	111,
  537,	699, 497,	121,	956,
  805,	732, 524,	37, 	331,
]
WIDTH = 5
MAX_X = 4
MAX_Y = 4
end

$memo = Array.new($matrix.size)

#$c = 0

def matrix(x, y)
  $matrix[x + y * WIDTH]
end

def memo(x, y)
  $memo[x + y * WIDTH]
end

def solve(x = 0, y = 0, stop = 0)
  #$c += 1
  return memo(x, y) if memo(x, y)
  return matrix(x, y) if x == MAX_X

  n = matrix(x, y)
  results = [n + solve(x + 1, y)]
  if y > 0 && stop <= 0
    results << n + solve(x, y - 1, -1)
  end
  if y < MAX_Y && stop >= 0
    results << n + solve(x, y + 1, 1)
  end
  $memo[x + y * WIDTH] = results.min
  $memo[x + y * WIDTH]
end

p (MAX_Y + 1).times.map {|y| solve(0, y)}.min
#p $c
