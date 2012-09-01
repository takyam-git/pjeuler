def ary_true_divisor(num)
  factors = Array.new(0)
  divisor = 2 # start from 2
  divided = num
  while ( divisor ** 2 <= divided ) do
    if (divided % divisor).zero? then
      factors << divisor
      divided = divided / divisor
      next
    end
    divisor += 1
  end
  factors << divided
  r_divisor([], factors)
end

def r_divisor(list, rest)
  return list.uniq if rest.empty?
  now = rest.shift
  new_list = Array.new
  if list.empty?
    new_list << now ** 0
    new_list << now ** 1
  else
    list.each do |n|
      new_list << n * now ** 0
      new_list << n * now ** 1
    end
  end
  r_divisor(new_list, rest)
end

def d(num)
  ary = ary_true_divisor(num)
  return ary.inject(&:+) - ary.max
end

@friend = Array.new
(1..9999).each do |n|
  m = d(n)
  if d(m) == n && m != n
    @friend << [n,m]
  end
end

p @friend.flatten.uniq.inject(&:+)
