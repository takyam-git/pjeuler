class Euler40
  def order(n)
    i = 0
    loop do
      return i if 10 ** i > n
      i += 1
    end
  end
  def get_number_of_a_position(n) 
    pos = 1
    idx = 1
    loop do
      if pos > n
        ary = Array.new
        ary = (idx - 1).to_s.split('')
        return [ (idx - 1), ary[-(pos - n)].to_i ]
      end
      pos += order(idx)
      idx += 1
    end
  end
end

@eu = Euler40.new
p @eu.get_number_of_a_position(1)[1] \
* @eu.get_number_of_a_position(10)[1] \
* @eu.get_number_of_a_position(100)[1] \
* @eu.get_number_of_a_position(1000)[1] \
* @eu.get_number_of_a_position(10000)[1] \
* @eu.get_number_of_a_position(100000)[1] \
* @eu.get_number_of_a_position(1000000)[1] \
