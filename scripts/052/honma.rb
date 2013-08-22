#!/usr/bin/env ruby
# coding : utf-8
now = Time.now
digit = 2;
catch(:break_loop) do
  loop do
    start_num = ("1" + "0" * digit).to_i
    end_num = (("1" + "0" * (digit + 1)).to_i / 6.to_f).to_i
    (start_num..end_num).each do |n|
      sort_num = n.to_s.split(//).sort
      (2 * n).to_s.split(//).sort == sort_num and
        (3 * n).to_s.split(//).sort == sort_num and
        (4 * n).to_s.split(//).sort == sort_num and
        (5 * n).to_s.split(//).sort == sort_num and
        (6 * n).to_s.split(//).sort == sort_num and p n and throw :break_loop
    end
    # throw :break_loop if digit == 5
    digit += 1
  end
end
p Time.now - now
