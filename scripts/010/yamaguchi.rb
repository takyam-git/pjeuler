#Problem 10 †
#10以下の素数の和は2 + 3 + 5 + 7 = 17である.
#200万以下の全ての素数の和を計算しなさい.


max = 2_000_000

###########################################################
#最終的に肥後さんのを参考にしました！
#############################################################
start = Time.now
#3～maxの奇数のみの配列を作る
numbers = (3..max).to_a.select{|num|!num.even?}
numbers_size = numbers.size
#配列を回す
numbers.each_with_index{|number, index|
  next if number.nil? #nilならskip
  next_index = index

  #倍数のものをnilにしていく
  while true
    next_index += number
    break if next_index >= numbers_size
    numbers[next_index] = nil
  end
}

#配列に2を加えて合計する
p numbers.unshift(2).inject(0){|sum,number|
  sum += number if !number.nil?
  sum
}

#ライブラリ利用バージョン
#start = Time.now
#require('prime')
#sum = 0
#Prime.each{|prime|
#  break if prime > max
#  sum += prime
#}
#p sum  #>>142913828922
#p ((Time.now - start)*1000).round.to_s + 'ms'

#エラトステネスの篩（エラトステネスのふるい）version
#http://ja.wikipedia.org/wiki/%E3%82%A8%E3%83%A9%E3%83%88%E3%82%B9%E3%83%86%E3%83%8D%E3%82%B9%E3%81%AE%E7%AF%A9
#start = Time.now
#max = 100
#numbers = (2..max).to_a
#primes = []
#while numbers.length > 0
#  #step2
#  prime = numbers.shift
#  primes << prime
#  #step3
#  numbers = numbers.inject([]){|ary,number|
#    ary << number if number % prime != 0
#    ary
#  }
#  p numbers
#  #step4
#  break if numbers.size == 0
#  next if numbers.max < Math.sqrt(primes.max)
#end
#p '---------------------------------------------'
#p primes
##p primes.concat(numbers).inject(0){|sum,i|sum+=i}


#さっぱり意味はわからんけど爆速ｗｗｗｗ
#copy from http://antimon2.hatenablog.jp/entry/2012/06/18/231118
#start = Time.now
#
## original: http://log.ttsky.net/article/19515687.html
#require 'prime'
#
#class Prime
#
#  # An implementation of +Prime::PseudoPrimeGenerator+.
#  class A2Generator < PseudoPrimeGenerator
#    def initialize
#      @h = {}
#      @n = nil
#      @d = nil
#      super
#    end
#
#    def succ
#      if @n.nil?
#        @n = 1
#        return 2
#      elsif @d.nil?
#        @d = 4
#        return 3
#      end
#      n = @n
#      d = @d
#      while true
#        m = n += d
#        if (b = @h[n])
#          k = ((m + b) % 3 == 0) ? 2 : 4
#          k = 6 - k while @h[m += b*k]
#          @h[m] = b
#          @h.delete(n)
#        else
#          k = 4
#          k = 6 - k while @h[m += n*k]
#          @d = 6 - d
#          return @n = @h[m] = n
#        end
#        d = 6 - d
#      end
#    end
#    alias next succ
#
#    def rewind
#      initialize
#    end
#  end
#end
#sum = 0
#Prime.each(max, Prime::A2Generator.new){|num|sum+=num}
#p sum
#p ((Time.now - start)*1000).round.to_s + 'ms'

#さすがに卑怯くさかったので自分が理解できる範囲のものをRubyにリプレース
#Primeライブラリ使った時と同じくらいの速度に。
# http://d.hatena.ne.jp/rockstar2007/20091105/1257422026
#start = Time.now
#max = 2_000_000
#primes = [2,3]
#sum = 5
#cnt = 0
#5.step(max,2){|number|
#  sqrt = Math.sqrt(number)
#  is_prime = true
#  primes.each{|prime|
#    cnt+=1
#    break if prime > sqrt
#    if number % prime == 0
#      is_prime = false
#      break
#    end
#  }
#  if is_prime
#    primes << number
#    sum += number
#  end
#}
#p sum
#p ((Time.now - start)*1000).round.to_s + 'ms' #>> 4321

##肥後さんのを参考に
#start = Time.now
#numbers = (3..max).to_a.select{|num|!num.even?}
#numbers_size = numbers.size
#numbers.each_with_index{|number, index|
#  next if number.nil?
#  next_index = index
#  while true
#    next_index += number
#    break if next_index >= numbers_size
#    numbers[next_index] = nil
#  end
#}
#p numbers.unshift(2).select!{|number|!number.nil?}.inject(0){|sum,number|sum+=number}
#5.step(max,2){|number|
#  sqrt = Math.sqrt(number)
#  is_prime = true
#  primes.each{|prime|
#    cnt+=1
#    break if prime > sqrt
#    if number % prime == 0
#      is_prime = false
#      break
#    end
#  }
#  if is_prime
#    primes << number
#    sum += number
#  end
#}
#p ((Time.now - start)*1000).round.to_s + 'ms' #>> 4321
