l = 0  # 現在の桁数
ll = 0 # 現在の桁数の桁数
mult = 1

(1..1000000).to_a.each do |n|
  n = n.to_s
  ll_tmp = ll
  l += n.length
  ll = l.to_s.length

  # 桁数が桁上りしたらなんやかんやする
  if ll - ll_tmp > 0
    break if ll_tmp==6
    i = n.length - (l - (10**ll_tmp)) - 1
    n = n.split(//)
    mult *= n[i].to_i
  end
end

p mult
