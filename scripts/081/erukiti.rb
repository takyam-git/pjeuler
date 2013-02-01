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

$c = 0

def matrix(x, y)
  $matrix[x + y * WIDTH]
end

def memo(x, y)
  $memo[x + y * WIDTH]
end

def solve(x = 0, y = 0)
  $c += 1
  return memo(x, y) unless memo(x, y).nil?

  if x == MAX_X && y == MAX_Y
    $memo[x + y * WIDTH] = matrix(x, y)
  elsif x == MAX_X
    $memo[x + y * WIDTH] = matrix(x, y) + solve(x, y + 1)
  elsif y == MAX_Y
    $memo[x + y * WIDTH] = matrix(x, y) + solve(x + 1, y)
  else
    $memo[x + y * WIDTH] = matrix(x, y) + [solve(x + 1, y), solve(x, y + 1)].min
  end
  $memo[x + y * WIDTH]
end

p solve
#p $c
