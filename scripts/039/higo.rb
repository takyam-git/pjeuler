# 三角形なので a + b > c
# cを固定してa + b を探す
# pは偶数
require 'set'
@loop = 0
@pit = Array.new
@max = 0
@max_at = 0

def solve(p)
  return if p % 2 != 0
  p p
  ans = 0
  (p/2).floor.downto(1) do |c|
    (1 .. ((p-c)/2).floor).each do |a|
      @loop += 1
      b = p - c - a
      if a ** 2 + b ** 2 == c ** 2
        @pit[p] = [] if ! @pit[p]
        @pit[p] << [a, b, c]
        ans += 1
      end
    end
  end
  if ans > @max
    @max = ans
    @max_at = p
  end
end

1000.downto(3) do |p|
  solve(p)
end
p @pit
p @max
p @max_at
puts "loop:" + @loop.to_s

