# partition number

# Johansson, "Efficient implementation of the Hardy-Ramanujan-Rademacher formula", 2012
# http://journals.cambridge.org/download.php?file=%2FJCM%2FJCM15%2FS1461157012001088a.pdf&code=dfb0fc9d7f72541e79829c68c457666d
# p(n) = sum_{k=1}^n (-1)^(k+1) [p(n - k(3k-1)/2) + p(n - k(3k+1)/2)]

@p = [1]

def p(n)
  n < 0 and return 0
  unless @p[n] 
    r = 0
    (1..n).each do |k|
      i1 = n - k*(3*k-1)/2
      i2 = n - k*(3*k+1)/2
      break if i1 < 0 && i2 < 0
      r += (k%2==0 ? -1 : 1) * (p(i1) + p(i2))
    end
    @p[n] = r
  end
  @p[n]
end

puts p(100)-1
