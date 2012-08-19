#! ruby -Kui

#回分数かどうか判定
def check(num)
  num.split('')
  if num.size != 6
   return false
  end
  if num[0]==num[5] && num[1]==num[4] && num[2]==num[3]
    return true
  else
    return false
  end
end
def kaibun()
  result = 0
  flag = 0
  max = 0
  999.downto(100){ |n1|
    999.downto(100){ |n2|
      result = n1*n2
      if check(result.to_s)
         if(max < result)
           max = result
         end
      end
   }
  }
  return max
end

p kaibun

