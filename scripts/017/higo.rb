
@t = {
  1  => "one",  2  => "two",  3  => "three",  4  => "four",  5  => "five",
  6  => "six",  7  => "seven",8  => "eight",  9  => "nine",  10 => "ten",
  11 => "eleven",  12 => "twelve", 13 => "thirteen", 14 => "fourteen", 15 => "fifteen",
  16 => "sixteen", 17 => "seventeen", 18 => "eighteen", 19 => "nineteen", 20 => "twenty",
  30 => "thirty",  40 => "forty", 50 => "fifty", 60 => "sixty", 70 => 'seventy', 
  80 => "eighty",  90 => "ninety", 100 => "hundred", 1000 => "thousand",
  :s => " ", :a => "and", :p => "-", 0 => ""
}

def translate(n)
  str = ""
  (d1000, m1000) = n.divmod(1000)
  str += @t[d1000] + @t[:s] + @t[1000] if n >= 1000
  str += @t[:s] + @t[:a] + @t[:s] if m1000 != 0 && str != ""
  (d100, m100) = m1000.divmod(100)
  str += @t[d100] + @t[:s] + @t[100] if d100 > 0
  str += @t[:s] + @t[:a] + @t[:s] if m100 != 0 && str != ""
  (d10, m10) = m100.divmod(10)
  str += @t[d10 * 10] if d10 > 1
  str += @t[:p] if d10 > 1 && m10 != 0
  str += @t[m100] if d10 == 1
  str += @t[m10] if d10 != 1 
  return str
end

def count(s)
  return s.count("a-z")
end
if $DEBUG
  (1 .. 1000).each do |n|
    puts "n:" + n.to_s + ":" + translate(n) + ":" + count(translate(n)).to_s
  end
end
p (1..1000).inject(0){|s,n| s += count(translate(n))}
