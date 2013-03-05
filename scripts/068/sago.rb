r = Array.new
(1..9).to_a.permutation.each do |a|
  if a[0]+a[1]+a[2] == a[3]+a[2]+a[4] && a[3]+a[2]+a[4] == a[7]+a[4]+a[5] && a[7]+a[4]+a[5] == 10+a[5]+a[6] && 10+a[5]+a[6]  == a[8]+a[6]+a[1]
    str1 = a[0].to_s + a[1].to_s + a[2].to_s
    str2 = a[3].to_s + a[2].to_s + a[4].to_s
    str3 = a[7].to_s + a[4].to_s + a[5].to_s
    str4 = 10.to_s + a[5].to_s + a[6].to_s
    str5 = a[8].to_s + a[6].to_s + a[1].to_s
    if a[0] < a[3] && a[0] < a[7] && a[0] < 10 && a[0] < a[8]
      r << (str1+str2+str3+str4+str5).to_i
    elsif a[3] < a[0] && a[3] < a[7] && a[3] < 10 && a[3] < a[8]
      r << (str2+str3+str4+str5+str1).to_i
    elsif a[7] < a[0] && a[7] < a[3] && a[7] < 10 && a[7] < a[8]
      r << (str3+str4+str5+str1+str2).to_i
    elsif 10 < a[0] && 10 < a[3] && 10 < a[7] && 10 < a[8]
      r << (str4+str5+str1+str2+str3).to_i
    else
      r << (str5+str1+str2+str3+str4).to_i
    end
  end
end

p r.max
