#coding: utf-8
array = Array.new()
for a1 in 1..10
  for a2 in 1..10
    next if a1 == a2
    for a3 in 1..10
      next if a1 == a3 || a2 == a3
      for a4 in 1..10
        next if a1 == a4 || a2 == a4 || a3 == a4
        for a5 in 1..10
          next if a1 == a5 || a2 == a5 || a3 == a5 || a4 ==a5
          for a6 in 1..10
            next if a1 == a6 || a2 == a6 || a3 == a6 || a4 == a6 || a5 == a6
            for a7 in 1..10
              next if a1 == a7 || a2 == a7 || a3 == a7 || a4 == a7 || a5 == a7 || a6 == a7
              for a8 in 1..10
                next if a1 == a8 || a2 == a8 || a3 == a8 || a4 == a8 || a5 == a8 || a6 == a8 || a7 == a8
                for a9 in 1..10
                  next if a1 == a9 || a2 == a9 || a3 == a9 || a4 == a9 || a5 == a9 || a6 == a9 || a7 == a9 || a8 == a9
                  for a10 in 1..10
                    next if a1 == a10 || a2 == a10 || a3 == a10 || a4 == a10 || a5 == a10 || a6 == a10 || a7 == a10 || a8 == a10 || a9 == a10
                    if a1+a2+a3 == a4+a3+a5 && a4+a3+a5 == a8+a5+a6 && a8+a5+a6 == a10+a6+a7 && a10+a6+a7  == a9+a7+a2
                      str1 = a1.to_s + a2.to_s + a3.to_s
                      str2 = a4.to_s + a3.to_s + a5.to_s
                      str3 = a8.to_s + a5.to_s + a6.to_s
                      str4 = a10.to_s + a6.to_s + a7.to_s
                      str5 = a9.to_s + a7.to_s + a2.to_s

                      if a1 < a4 && a1 < a8 && a1 < a10 && a1 < a9
                        array << str1+str2+str3+str4+str5
                      elsif a4 < a1 && a4 < a8 && a4 < a10 && a4 < a9
                        array << str2+str3+str4+str5+str1
                      elsif a8 < a1 && a8 < a4 && a8 < a10 && a8 < a9
                        array << str3+str4+str5+str1+str2
                      elsif a10 < a1 && a10 < a4 && a10 < a8 && a10 < a9
                        array << str4+str5+str1+str2+str3
                      else
                        array << str5+str1+str2+str3+str4
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
ans = Array.new
array.each do |a|
  ans << a.to_i if a.size == 16
end

p ans.max

