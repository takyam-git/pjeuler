start = Time.now

names = File.read("names.txt").gsub(/"/,"").split(/,/)
names.sort!
score = 0
names.each_index do |i|
  s = 0
  names[i].each_byte{|c|s += c - 64}
  score += s * (i + 1)
end
p score
print "took " + ((Time.now - start) * 1000).round.to_s + "ms.\n"

