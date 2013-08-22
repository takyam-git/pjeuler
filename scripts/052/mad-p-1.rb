def digits(n)
  r = 0
  c = 0
  while n > 0
    b = 1 << (n % 10)
    if (r & b) == 0
      r |= b
      c += 1
    end
    n /= 10
  end
  [r, c]
end  

def solve(n)
  while true
    n += 1
    d, c = digits(n)
    next if c != n.to_s.size
    catch :skip do
      (2..6).each do |mul|
        m = mul * n
        d1, _ = digits(m)
        d == d1 or throw :skip
      end
      return n
    end
  end
end

