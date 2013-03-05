
nums = [1,2,3,4,5,6,7,8,9,10]
results = []

def createPattern(pattern, sum, used)
  idx = pattern.size
  pattern.push([nil, pattern[idx-1][2], nil])
  result = []
  10.times do |n|
    idx = pattern.size - 1
    unless used[n]
      m = sum - pattern[idx][1] - n
      if m > 0 && m <= 10 && m!=n && !used[m]
        used_tmp = used 
        pattern_tmp = pattern
        pattern_tmp[idx][0] = n
        pattern_tmp[idx][2] = m
        used_tmp[n] = true
        used_tmp[m] = true
        if idx==4
          result.push generateStr pattern_tmp
        else
          result += createPattern pattern_tmp, sum, used_tmp
        end
      end
    end
  end
  return result
end

def generateStr(pattern)
  result = []
  5.times do |n|
    str = ""
    5.times do |m|
      str += pattern[(m+n)%5].join
    end
    result.push str.to_i
  end
  return result.min
end

nums.permutation(3) do |initialNum|
  sum = initialNum.inject(:+)
  if sum > 12 && sum <=16
    used = Array.new(11).fill(false)
    initialNum.each {|n| used[n] = true }
    pattern = [initialNum]
    results += createPattern pattern, sum, used
  end
end

p results.max
