# Problem 15  †
# 2 × 2 のマス目の左上からスタートした場合、引き返しなしで右下にいくルートは 6 つある。
# では、20 × 20 のマス目ではいくつのルートがあるか。
num = 20
# Ruby風にした
class Integer
  def !
    (1..self).inject(&:*)
  end
end
p((num * 2).!/(num.!** 2))
