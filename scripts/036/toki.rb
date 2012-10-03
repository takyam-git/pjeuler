def chkrev(num,base)
  strnum = num.to_s(base)
  digits = strnum.length
  if strnum == strnum.reverse
    return true
  end
  return false
end

sum = 0
for num in 1..999
  numstr = num.to_s
  revstr = numstr.reverse
  revnum1 = (numstr + revstr).to_i
  revnum2 = (numstr + revstr[1..numstr.length-1]).to_i
  if chkrev(revnum1,2)
    sum = sum + revnum1
# p revnum1
  end
  if chkrev(revnum2,2)
    sum = sum + revnum2
# p revnum2
  end
end

p sum
# お願いしまーす！！