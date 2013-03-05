#!/usr/bin/env ruby
# coding : utf-8
answer_ary = []
answer_value = 0
(1..10).to_a.permutation(3) {|a, b, c|
  # 最初の要素を出す
  # p [a, b, c]
  answer_ary << [a, b, c]
  ary = (1..10).to_a
  [a, b, c].each do |n|
    ary.to_a.delete(n)
  end
  # 残りの要素を出す
  ary.permutation(2) {|d, e|
    answer_ary << [d, c, e]
    unless answer_ary[0].inject(&:+) == answer_ary[1].inject(&:+)
      answer_ary.pop
      next
    end
    ary2 = (1..10).to_a
    [a, b, c, d, e].each do |n|
      ary2.to_a.delete(n)
    end
    ary2.permutation(2) {|f, g|
      answer_ary << [f, e, g]
      unless answer_ary[1].inject(&:+) == answer_ary[2].inject(&:+)
        answer_ary.pop
        next
      end
      ary3 = (1..10).to_a
      [a, b, c, d, e, f, g].each do |n|
        ary3.to_a.delete(n)
      end
      ary3.permutation(2) {|h, i|
        answer_ary << [h, g, i]
        unless answer_ary[2].inject(&:+) == answer_ary[3].inject(&:+)
          answer_ary.pop
          next
        end
        ary4 = (1..10).to_a
        [a, b, c, d, e, f, g, h, i].each do |n|
          ary4.to_a.delete(n)
        end
        j = ary4[0]
        answer_ary << [j, i, b]
        unless answer_ary[3].inject(&:+) == answer_ary[4].inject(&:+)
          answer_ary.pop
          answer_ary.pop
          next
        end

        # "magic" 5-gon ringがとりあえずできた
        min_index = 0
        min_value = 11
        answer_ary.each_with_index do |min, i|
          if min[0] < min_value
            min_value = min[0]
            min_index = i
          end
        end
        min_index.times do
          tmp = answer_ary.shift
          answer_ary << tmp
        end
        ans = answer_ary.flatten.join.to_i
        answer_value = ans if ans.to_s.length == 16 and answer_value < ans
        answer_ary.pop
        answer_ary.pop
      }
      answer_ary.pop
    }
    answer_ary.pop
  }
  answer_ary = []
}
p answer_value
