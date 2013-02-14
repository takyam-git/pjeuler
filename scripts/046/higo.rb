require 'mathn'

def is_goldbach(n)
  #return if n.prime?
  max = Math.sqrt( n / 2 ).to_i
  max.downto(1) do |m|
    #p [m, (n - 2 * m * m)]
    return true if (n - 2 * m * m).prime?
  end
  return false
end

n = 33
loop do
  unless n.prime?
    unless is_goldbach(n)
      p n
      break
    end
  end
  n += 2
end

