#パスカルの三角
#http://ja.wikipedia.org/wiki/%E3%83%91%E3%82%B9%E3%82%AB%E3%83%AB%E3%81%AE%E4%B8%89%E8%A7%92%E5%BD%A2
#1
#11
#121
#1331
#14641
#15[10][10]51
class Integer
  def pascal
    limit = self*2
    rows = [[1]]
    before = 0
    1.upto(limit) do |row_num|
      row_ary = []
      before = rows[row_num - 1]
      0.upto(row_num) do |num|
        sum = 0
        minus = num - 1
        sum += before[minus] if minus >= 0 and !before[minus].nil?
        sum += before[num] if !before[num].nil?
        sum = 1 if sum == 0
        row_ary << sum
      end
      rows << row_ary
    end
    rows[limit].max
  end
end
p 20.pascal