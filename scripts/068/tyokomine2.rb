# coding: utf-8

nums= (1..10).to_a
array = Array.new
nums.permutation.each do |a|
  if a[0]+a[1]+a[2] == a[3]+a[2]+a[4] && a[3]+a[2]+a[4] == a[7]+a[4]+a[5] && a[7]+a[4]+a[5] == a[9]+a[5]+a[6] && a[9]+a[5]+a[6]  == a[8]+a[6]+a[1]
    str1 = a[0].to_s + a[1].to_s + a[2].to_s
    str2 = a[3].to_s + a[2].to_s + a[4].to_s
    str3 = a[7].to_s + a[4].to_s + a[5].to_s
    str4 = a[9].to_s + a[5].to_s + a[6].to_s
    str5 = a[8].to_s + a[6].to_s + a[1].to_s
    if a[0] < a[3] && a[0] < a[7] && a[0] < a[9] && a[0] < a[8]
      array << str1+str2+str3+str4+str5
    elsif a[3] < a[0] && a[3] < a[7] && a[3] < a[9] && a[3] < a[8]
      array << str2+str3+str4+str5+str1
    elsif a[7] < a[0] && a[7] < a[3] && a[7] < a[9] && a[7] < a[8]
      array << str3+str4+str5+str1+str2
    elsif a[9] < a[0] && a[9] < a[3] && a[9] < a[7] && a[9] < a[8]
      array << str4+str5+str1+str2+str3
    else
      array << str5+str1+str2+str3+str4
    end
  end
end


ans = Array.new
array.each do |a|
  ans << a.to_i if a.size == 16
end
p ans.max

