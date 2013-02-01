
f = open("matrix.txt")
matrix = Array.new
f.each do |line| 
  matrix.push(line.chomp.split(','))
end

sleep(2)
p matrix[0][0]


#l = matrix.size
#(0 .. l).each.



#matrix.each_with_index do |line, n|
#  n.times do
#    line.unshift(nil)
#  end
#end
#p matrix.reverse.zip!

#(matrix[-1].size-1).downto(0) do |j|
#  (matrix.size-1).downto(0) do |i|
#    p matrix[i][j]
#  end
#  #p matrix[-1][j]
#end

