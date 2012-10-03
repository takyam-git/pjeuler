# encoding : utf-8
def to_en s
  if s==1 || s==2 || s==6 || s==10
    return 3
  elsif s==4 || s==5 || s==9
    return 4
  elsif s==3||s==7||s==8||s==40||s==50||s==60
    return 5
  elsif s==11||s==12||s==20||s==30||s==80||s==90
    return 6
  elsif s==15||s==16||s==70
    return 7
  elsif s==13||s==14||s==18||s==19
    return 8
  elsif s==17
    return 9
  elsif s==1000
    return 11
  elsif s>20 && s<100
    one = to_en(s%10)
    ten = to_en(s-s%10)
    return one+ten
  elsif s>=100 && s<1000
    a = s/100
    b = s%100
    if b==0
      return to_en(a)+7
    else
      return to_en(a)+10+to_en(b)
    end
  end
end
result = 0
for i in 1..1000
  result += to_en(i)
end
p result
