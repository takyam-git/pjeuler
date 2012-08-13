# encoding: utf-8
start = Time.now
min = 100
max = 999
max_palindrome = 0
catch(:finish){
  #1番目の値を999,998...とループ
  max.downto(min){|num1|
    #2番目の値を999,998...とループ
    max.downto(min){|num2|
      #とりあえず乗算
      product = num1 * num2
      #乗積が現在の最大回文数より小さければ
      if product <= max_palindrome
        #num2がmax(999)と等しくても最大回文数より小さければ
        #これ以上処理を続けても意味ないので終了
        throw :finish if num2 == max
        #このnum1はスキップして次のnum1へ
        break
      end
      #乗積を配列に変換して、reverseした状態で等しければ回分数とする
      product_array = product.to_s.split ''
      if product_array == product_array.reverse
        max_palindrome = product
        #このnum1でこれ以上大きい回分数は出てこないので次のnum1へ
        break
      end
    }
  }
}
p max_palindrome #=> 906609
p ((Time.now - start) * 1000).round #=> 80ms前後