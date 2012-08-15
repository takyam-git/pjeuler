start = Time.now
# 200万個の配列を作って、素数じゃないidxをnilにしていくアプローチ
ary = Array.new(2_000_000){ 1 }
ary[0] = ary[1] = nil
primes = Array.new
idx = 2 # start from 2

loop_cnt = 0
while idx <= ary.size do
  # すでにnilになっているidxは素数じゃない
  unless ary[idx] == nil then
      primes << idx
      # 素数に遭遇したらそのn倍をnilにする
      # ちなみに idx * 2, idx * 3 ... はすでに落とされているので
      # loopの開始は、idx * idx からでよい
      for n in (idx .. ( ary.size / idx ).to_i ) do
        loop_cnt += 1
        ary[idx * n] = nil
      end
  end
  idx += 1
#  p idx
end
p primes.inject(0){|s, i| s += i}
print "loop_cnt: #{loop_cnt}\n"
print "took " + ((Time.now - start) * 1000).round.to_s + "ms.\n"
