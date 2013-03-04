# coding: utf-8
max = 0
(1..9).to_a.permutation(5).each do |penta|
  penta.push(penta.first)
  ((1..10).to_a - penta).permutation(5).each do |outside|
    zipped = outside.zip(penta.each_cons(2).to_a)

    triple = zipped.map do |a, (b, c)|
      [a, b, c]
    end

    results = triple.map{|a, b, c| a + b + c}

    if results.all? {|e| e == results.first }
      outside_min = outside.min
      idx = triple.find_index{|a, b, c| outside_min == a }
      num = (idx == 0 ? triple : triple[idx..-1] + triple[0..idx-1]).flatten.map{|e| e.to_s }.join.to_i
      max = [max, num].max
    end
  end
end

puts max
