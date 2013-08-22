#!/usr/bin/env ruby
# coding : utf-8
now = Time.now
digit = 3;
catch(:break_loop) do
  loop do
    start_num = ("1" + "0" * (digit - 1)).to_i
    end_num = (("1" + "0" * digit).to_i / 6.to_f).to_i
    (start_num..end_num).each do |n|
      (2 * n).to_s.split(//).sort == n.to_s.split(//).sort and
        (3 * n).to_s.split(//).sort == n.to_s.split(//).sort and
        (4 * n).to_s.split(//).sort == n.to_s.split(//).sort and
        (5 * n).to_s.split(//).sort == n.to_s.split(//).sort and
        (6 * n).to_s.split(//).sort == n.to_s.split(//).sort and p n and throw :break_loop
    end
    digit += 1
  end
end
p Time.now - now
