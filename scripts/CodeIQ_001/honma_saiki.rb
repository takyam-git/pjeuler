# 1~9の数字を使った3桁割る3桁の分数のうち1/2よりも小さくなるものの総数は全体の何％か？
# 再帰
t = Time.now
numbers = (1..9).to_a
@all_count = 0
@half_count = 0
def generate_list(need_num, selected_list, num_list)
  if need_num == 0
    @all_count += 1
    if selected_list[0..2].join.to_i / selected_list[3..5].join.to_f < 0.5
      @half_count += 1
    end
    selected_list = []
    return
  end
  num_list.each do |n|
    generate_list(need_num - 1, selected_list + [n], num_list.reject{|m|n == m})
  end
end
generate_list(6, [], numbers)
print "%.2f" % ((@half_count / @all_count.to_f) * 100), "%\n"
p Time.now - t
