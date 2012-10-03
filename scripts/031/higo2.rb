# 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p)

@cnt = 0
(0 .. 1).each do |p200|
  r1 = 200 - 200 * p200
  if r1 == 0 then @cnt += 1; next; end
  (0 .. (r1/100).to_i).each do |p100|
    r2 = r1 - 100 * p100
    if r2 == 0 then @cnt += 1; next end
    (0 .. (r2/50).to_i).each do |p50|
      r3 = r2 - 50 * p50
      if r3 == 0 then @cnt += 1; next end
      (0 .. (r3/20).to_i).each do |p20|
        r4 = r3 - 20 * p20
        if r4 == 0 then @cnt += 1; next end
        (0 .. (r4/10).to_i).each do |p10|
          r5 = r4 - 10 * p10
          if r5 == 0 then @cnt += 1; next end
          (0 .. (r5/5).to_i).each do |p5|
            r6 = r5 - 5 * p5
            if r6 == 0 then @cnt += 1; next end
            (0 .. (r6/2).to_i).each do |p2|
              r7 = r6 - 2 * p2
              if r7 == 0 then @cnt += 1; next end
              # 1penceは常にゼロにできる
              @cnt += 1
            end
          end
        end
      end
    end
  end
end

p @cnt
