#驚くべきことに, 各桁を4乗した数の和が元の数と一致する数は3つしかない.
#
#1634 = 14 + 64 + 34 + 44
#8208 = 84 + 24 + 04 + 84
#9474 = 94 + 44 + 74 + 44
#ただし, 1=14は含まないものとする. この数たちの和は 1634 + 8208 + 9474 = 19316 である.
#
#各桁を5乗した数の和が元の数と一致するような数の総和を求めよ.

result = 0
for a in 0..2
  for b in 0..9
    for c in 0..9
      for d in 0..9
        for e in 0..9
          for f in 0..9
            tmp = a**5+b**5+c**5+d**5+e**5+f**5
            str = tmp.to_s
            as = a.to_s
            bs = b.to_s
            cs = c.to_s
            ds = d.to_s
            es = e.to_s
            fs = f.to_s
            if str == as+bs+cs+ds+es+fs ||
              (a == 0 && str == bs+cs+ds+es+fs) || 
              (a == 0 && str == cs+ds+es+fs)

              result += str.to_i
            end
          end
        end
      end
    end
  end
end
p result
