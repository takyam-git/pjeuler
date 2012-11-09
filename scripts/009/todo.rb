def euler009(sum)
  1.upto(sum-2) do |a|
    (a+1).upto(sum-1) do |b|
      c = (sum - a - b)

      if (a*a + b*b == c*c && a+b+c == 1000)
        p a*b*c
        break
      end
    end
  end
end

euler009(1000)

