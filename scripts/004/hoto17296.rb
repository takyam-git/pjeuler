list = []
catch(:exit) do
  9.downto(1) do |k|
    999.downto(k*100) do |n|
      999.downto(k*100) do |m|
        catch(:next) do
          s = (n*m).to_s.split(//)
          l = s.length / 2
          l.times do |i|
            throw :next if s[i] != s[(-1)*(i+1)]
          end
          list.push n*m
        end
      end
      throw :exit if list.size > 0
    end
  end
end
p list.max
