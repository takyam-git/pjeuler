# 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p)
@pence = [200, 100, 50, 20, 10, 5, 2, 1]
@results = []

def rest(ary)
  sum = 0
  ary.each_index{|i| sum += @pence[i] * ary[i]}
  @results << ary if sum == 200
  return 200 - sum
end

(0 .. 1).each do |p200|
  rest = rest([p200])
  next if rest == 0
  (0 .. (rest/100).to_i).each do |p100|
    rest = rest([p200, p100])
    next if rest == 0
    (0 .. (rest/50).to_i).each do |p50|
      rest = rest([p200, p100, p50])
      next if rest == 0
      (0 .. (rest/20).to_i).each do |p20|
        rest = rest([p200, p100, p50, p20])
        next if rest == 0
        (0 .. (rest/10).to_i).each do |p10|
          rest = rest([p200, p100, p50, p20, p10])
          next if rest == 0
          (0 .. (rest/5).to_i).each do |p5|
            rest = rest([p200, p100, p50, p20, p10, p5])
            next if rest == 0
            (0 .. (rest/2).to_i).each do |p2|
              rest = rest([p200, p100, p50, p20, p10, p5, p2])
              next if rest == 0
              # 1penceは常にゼロにできる
              rest([p200, p100, p50, p20, p10, p5, p2, rest])
            end
          end
        end
      end
    end
  end
end

p @results.size
