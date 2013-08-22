#!/usr/bin/env ruby
# coding : utf-8
now = Time.now
(123456..166666).each do |n|
  sort_num = n.to_s.split(//).sort
  (2 * n).to_s.split(//).sort == sort_num and
    (3 * n).to_s.split(//).sort == sort_num and
    (4 * n).to_s.split(//).sort == sort_num and
    (5 * n).to_s.split(//).sort == sort_num and
    (6 * n).to_s.split(//).sort == sort_num and
    p n and break
end
p Time.now - now
