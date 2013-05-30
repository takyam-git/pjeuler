# 三角形なので a + b > c
# cを固定してa + b を探す
# cは500から減
@loop = 0
@pit = Array.new

def solve(p)
  (p/2).floor.downto(1) do |c|
    #(1 .. ((1000-c)/2).to_i).each do |a|
    #  @loop += 1
    #  b = 1000 - c - a
    #  if a ** 2 + b ** 2 == c ** 2
    #    p [a, b, c].inject(:*)
    #    puts "loop:" + @loop.to_s
    #    break
    #  end
    #end
    p c
  end
end

solve(100)
