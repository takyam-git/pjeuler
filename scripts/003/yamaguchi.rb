# encoding: utf-8
#Problem 3 †
#13195 の素因数は 5、7、13、29 である。
#
#600851475143 の素因数のうち最大のものを求めよ

input = 600851475143

#start = Time.now
#Math::sqrt(input).to_i().downto(2){|num|
#  if input % num == 0
#    catch(:next){
#      2.upto((num / 2).to_i){|i| throw :next if num % i == 0 }
#      p num          #>> 6857
#      p ((Time.now - start) * 1000).round().to_s + 'ms' #>> under 100ms
#      exit
#    }
#  end
#}

catch(:fin) {
  Math::sqrt(input).to_i.downto(2){|num|
    catch(:next){
      2.upto((num / 2).to_i) {|i| throw :next if num % i == 0 }
      p num
      throw :fin
    } if input % num == 0
  }
}
