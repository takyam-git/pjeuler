def factorial_array(num)
  factors = Array.new
  divisor = 2 # start from 2
  divided = num.to_i
  while ( divisor <= divided ) do
    if (divided % divisor).zero? then
      factors << divisor
      divided = divided / divisor
      next
    end
    divisor += 1
  end
  return factors
end

cnt_hash = Hash.new(0)
(1..20).each{|n|
  cmp_hash = Hash.new(0)
  # 素因数分解して、数値をkeyにしてcount => cmp_hash
  factorial_array(n).each{|n|
    cmp_hash[n] += 1
  }
  # 各素因数について、cnt_hashより大きければ、cmp_hashの数にする
  cmp_hash.each{|key,num|
    cnt_hash[key] = cmp_hash[key] if cmp_hash[key] > cnt_hash[key]
  }
}
answer = 1
cnt_hash.each{|key,num|
  #p key,num
  answer *= (key.to_i) ** num
}
p cnt_hash
p answer
