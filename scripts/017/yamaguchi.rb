lens = {0 => 0}

words_19 = %w(one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
words_19.each_with_index do |num, index|
  lens[index+1]=num.size
end
words_10 = %w(twenty thirty forty fifty sixty seventy eighty ninety)
words_10.each_with_index do |num, index|
  base = (index + 2) * 10
  size = num.size
  lens[base] = size
  1.upto(9) do |pow|
    lens[base+pow] = size + lens[pow]
  end
end

sep = 'and'.size
hundred = 'hundred'.size

sum = 0

1.upto(999) do |num|
  if num < 100
    sum+=lens[num]
  else
    hand = hundred + lens[num / 100]
    sum += hand
    remainder = num % 100
    if remainder != 0  #100の倍数
      sum += sep + lens[remainder]
    end
  end
end

p sum + 'one'.size + 'thousand'.size