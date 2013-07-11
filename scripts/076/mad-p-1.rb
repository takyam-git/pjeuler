# partition number

# p(k,n) = n's partitioning that consists of only integers >= k

# p(n) = 1 + sum_{k=1}^{floor(n/2)} p(k,n-k) = p(1,n)

# p(1,0) = 1 (by convention)
# p(k,n) = 0 (k > n)
#        = 1 (k == n)
#        = p(k+1,n) + p(k,n-k)  (otherwise)

@p = [[1]]

def p(k,n)
  k == 1 && n == 0  and return 1
  k > n             and return 0
  k > n/2 && k <= n and return 1
  unless @p[n] && @p[n][k]
    (@p.size..n).each do |j|
      @p[j] = []
      j.downto(1) do |i|
        @p[j][i] = p(i+1, j) + p(i, j-i)
      end
    end
  end
  @p[n][k]
end

puts p(1,100)-1

