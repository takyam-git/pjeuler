# encoding: utf-8
def is_five(n)
  ans = (Math::sqrt(n*24+1)+1)/6 
  if ans == ans.to_i 
    return true
  else
    return false
  end
end

five = Array.new
i = 0
loop do
  i += 1
  n = i*(3*i-1)/2
  flag = false
  five.each do |f|
    break if flag
    if is_five(n-f) && is_five(n+f) 
      flag = true
      p n-f
      break
    end
  end
  break if flag
  five << n
end
