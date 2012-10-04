@ary = Array.new
(11 .. 99).each do |m|
  (11 ... m).each do |c|
    m_ary = m.to_s.split("")
    c_ary = c.to_s.split("")
    next if m_ary[0] == m_ary[1] # 分子/分母が11などの時は省く
    next if c_ary[0] == c_ary[1]
    next unless m_ary.index("0").nil? && c_ary.index("0").nil?
    #puts m.to_s + ":" + c.to_s + "\n"
    m_ary.each do |s|
      next if c_ary.index(s).nil?
      #puts m.to_s + ":" + c.to_s + "\n"
      m_ary.delete(s)
      c_ary.delete(s)
      if c.to_f/m.to_f == (c_ary.join.to_f / m_ary.join.to_f) then
        #puts m.to_s + ":" + c.to_s + "\n"
        @ary << Rational(c,m)
      end
    end
  end
end

p @ary.inject(:*).denominator
