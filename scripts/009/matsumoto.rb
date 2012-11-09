for i in 1..1000 do
  for j in i+1..1000 do
    k = 1000 - (i + j)
    if k < 1 then
      break
    end

    if k*k == i*i + j*j then
      p i * j * k    
    end
  end
end

