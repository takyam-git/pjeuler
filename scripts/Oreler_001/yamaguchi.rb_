# project oreler 001
#0から9の数字を使った3桁の数値を2回か3回掛け合わせた時の値のうち、一番桁が大きい数字と一番桁が小さい数字が同じものはなんこあるでしょうか。なお、1から9の数は一度の積算の中で一度しか使えません。
#
#123*456*789はok
#123*432はng
#
#また、123*456と456*123や、123*456*789と456*123*789のように、
#同じ数値の組み合わせで掛けあわせたものは同一のものとみなし、
#2回計算しないようにしましょう。

class Array
  def reject_array(numbers)
    self.reject{|self_number|numbers.include?(self_number)}
  end
end

cnt = 0
numbers = (0..9).to_a.reverse
two,three = [], []
numbers.each{|a|
  next if a == 0
  numbers.reject_array([a]).each{|b|
    numbers.reject_array([a,b]).each{|c|
      numbers.reject_array([a,b,c]).each{|d|
        next if d == 0
        numbers.reject_array([a,b,c,d]).each{|e|
          numbers.reject_array([a,b,c,d,e]).each{|f|
            num1 = (a*100+b*10+c)
            num2 = (d*100+e*10+f)
            two << [num1,num2].sort
            numbers.reject_array([a,b,c,d,e,f]).each{|g|
              next if g == 0
              numbers.reject_array([a,b,c,d,e,f,g]).each{|h|
                numbers.reject_array([a,b,c,d,e,f,g,h]).each{|i|
                  three << [num1,num2,(g*100+h*10+i)].sort
                }
              }
            }
          }
        }
      }
    }
  }
}
sum = 0
sum += two.uniq!.select{|num1, num2|
  r = (num1 * num2).to_s.split(//)
  r[0] == r[r.size - 1]
}.size
p 'two >> ' + sum.to_s
sum += three.uniq!.select{|num1, num2, num3|
  r = (num1 * num2 * num3).to_s.split(//)
  r[0] == r[r.size - 1]
}.size
p 'result >> ' + sum.to_s