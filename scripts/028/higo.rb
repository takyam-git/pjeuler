# n >= 2 にて、
# (2 * n - 1)列の場合の4隅は 2*(n-1) 飛びの4つ

a = Array.new
a << [0]
a << [1] # n = 1
(2 .. 501).each do |n|
  prev = a[n-1].max
  a << [prev + 2*(n-1), prev + 4*(n-1), prev + 6*(n-1), prev + 8*(n-1)]
end
p a.flatten.inject(&:+)
#p a
