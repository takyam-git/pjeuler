#!/usr/bin/env ruby
# coding : utf-8
count = 0
(0..9).to_a.permutation do |n|
  count += 1
  if count == 1_000_000
    p n.join
  end
end
