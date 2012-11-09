max_cnt = 0
ans_p = 0


for p in 12..1000 do

  if p % 3 != 0 then
    next
  end

  cnt = 0
  for a in 1...p-2 do
    if a + 1 > p - a then
      next
    end

    for b in a+1..p-a do
      c = p - (a + b)
      if c <= b then
        break
      end

      if c*c == a*a + b*b then
        cnt += 1
      end
    end

    if cnt > max_cnt then
      max_cnt = cnt
      ans_p = p
    end
  end
end
p ans_p

