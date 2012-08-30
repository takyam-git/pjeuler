
names = ''
f = open('names.txt')
f.each {|line| names += line if line != ''}
f.close

names = names.gsub('"', '').split(',').sort
alpha = {}
('A'..'Z').each_with_index{|b,i| alpha[b] = i + 1}

total = 0
names.each_with_index{|name, idx|
  name_ary = name.split //
  sum = name_ary.inject(0){|s,n| s += alpha[n]}
  total += (sum * (idx + 1))
}
p total