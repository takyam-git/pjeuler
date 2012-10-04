#Problem 32 †
#7254は面白い性質を持っている. 39 × 186 = 7254と書け, 掛けられる数/掛ける数/積に1から9の数が1回ずつ出現する.
#掛けられる数/掛ける数/積に1から9の数が1回ずつ出現するような積の総和を求めよ.
#HINT: いくつかの積は, 1通り以上の掛けられる数/掛ける数/積の組み合わせを持つが1回だけ数え上げよ.

#3桁かける2桁（or 2桁かける3桁) = 4桁 か、 1桁×4桁 = 5桁 のときのみ条件を満たす

@multiples = [] #answers
def check(a,b,c,d,e)
  a.upto(b) do |a|
    next if !a.to_s.index('0').nil?
    c.upto(d) do |b|
      next if !b.to_s.index('0').nil?
      multiple = a * b
      break if multiple > e
      next if !multiple.to_s.index('0').nil?
      @multiples << multiple if "#{a}#{b}#{multiple}".split('').uniq.size == 9
    end
  end
end
check(1,9,1234,9876,9876) #1*4 part
check(12,98,123,987,9876) #2*3 part
p @multiples.uniq.inject(:+)