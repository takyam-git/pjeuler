# コンセプト
# 自然数 n の逆数の循環節の長さは、n の最大の素因数を p とすると、たかだか p － 1 桁
# これホント？

def ary_prime_factor(num)
  factors = Array.new(0)
  divisor = 2 # start from 2
  divided = num
  while ( divisor ** 2 <= divided ) do
    if (divided % divisor).zero? then
      factors << divisor
      divided = divided / divisor
      next
    end
    divisor += 1
  end
  factors << divided
end

def cyclic(num, ary = [])
  return 0 if 10000 % num == 0
  #s = ary.max - 1 # たかだかs桁
  s = num - 1
  cyc = 0
  rational = (10 ** (2 * (s + 2)) / num ) .to_s # 繰り返しが現れるように*2
  s.downto(1).each do |n|
    part = rational.slice(rational.length - n, n) # 繰り返し候補を末尾から
    if rational =~ /(#{part}){2}/
      # 素因数倍の循環をチェック
      #(2 .. (n/2)).each do |m|
      ary_prime_factor(n).each do |m|
        next if n % m != 0
        part2 = part.slice(0, n / m)
        if rational =~ /(#{part2}){2}/
          part = part2
          n = n / m
          redo
        else
          next
        end
      end
      #puts "cyclic: " + n.to_s + " : " + part.to_s
      cyc = n
      break # 循環が見つかったら終了
    end
  end
  return cyc
  #puts num.to_s + ":" 
end

max = 0
maxat = 0
(1..999).each do |n|
  cyc = cyclic(n)
  if cyc > max
    max = cyc
    maxat = n
  end
end
p maxat
