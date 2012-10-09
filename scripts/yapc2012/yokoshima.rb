# エラトステネスの篩
max_count  = 10000
multiplier = 1
while 10 ** (multiplier + 1) <= max_count / 10
        multiplier += 1
end
max_num = (max_count * 10 * ( 1.1 ** multiplier  )).to_i
sum        = 0
max_sqrt   = Math::sqrt(max_num)
skip_list  = Array.new( max_num + 1 )
count      = 0

for index in 2..max_sqrt
        next unless skip_list[index].nil?
        j = 1
        while index * j <= max_num
                skip_list[ index * j ] = 1
                j += 1
        end
        sum += index
        count += 1
end

index = (max_sqrt/2).to_i * 2  + 1
while index <= max_num
        if skip_list[index].nil?
                sum += index
                count += 1
        end
        index += 2;
        break if count >= max_count;
end
puts sum

