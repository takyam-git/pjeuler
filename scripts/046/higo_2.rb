# encoding: utf-8
# ふるい落とすアプローチ
require 'prime'
require 'set'
max = 10000
generator = Prime::EratosthenesGenerator.new

p_ary = Array.new
p = 0
while p < max do
  p = generator.next
  p_ary.push(p)
end

s_max = Math.sqrt(max / 2).to_i
s_ary = Array.new
s = 1
while s < s_max do
  s_ary.push(2 * s * s)
  s += 1
end

o_set = Set.new
o = 33
while o < max do
  o_set.add(o)
  o += 2
end

s_ary.each do |s|
  p_ary.each do |p|
    # 素数自身は取り除く
    o_set.delete(p)
    break if s + p > max 
    o_set.delete(s + p)
  end
end

puts o_set.to_a.to_s + " under " + max.to_s
