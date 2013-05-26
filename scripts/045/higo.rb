
class Euler045
  def initialize
    @i = 1
  end
  def next_hex
    hex = @i * ( 2 * @i - 1 )
    @i += 1
    return hex
  end
  def is_penta?(p)
    return true if ( Math.sqrt( 24 * p + 1 ) + 1 ) % 6 == 0
    return false
  end
  def is_tri?(p)
    return true if ( Math.sqrt( 8 * p + 1 ) - 1 ) % 2 == 0
    return false
  end
  def run
    hex = 1
    while ( hex <= 40755 || ! self.is_penta?(hex) || ! self.is_tri?(hex) ) do
      hex = self.next_hex
    end
    return hex
  end
end

@eu = Euler045.new
p @eu.run
