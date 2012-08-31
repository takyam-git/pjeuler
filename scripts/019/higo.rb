# 1900 is not a leap year
# 1: Monday
@week = %w( Sun Mon Tue Wed Thu Fri Sat )
@day = [1901, 1, 1]
@@dotw = ( 1 + 365 ) % 7 # day of this week
@@cnt = 0

def @day.y
  return self[0]
end
def @day.y=(year)
  self[0] = year
end
def @day.m
  return self[1]
end
def @day.m=(month)
  self[1] = month
end
def @day.d
  return self[2]
end
def @day.d=(day)
  self[2] = day
end
def @day.p
  puts self.y.to_s + "-" + self.m.to_s + "-" + self.d.to_s
end

def @day.next
  @@cnt += 1 if ( self.d == 1 && @@dotw == 0 )
  if [4, 6, 9, 11].index( self.m )
    if self.d == 30
      self.m += 1
      self.d = 1
    else
      self.d += 1
    end
  elsif self.m == 2
    # 400年は略。
    if self.y % 4 == 0 && self.y % 100 != 0
      if self.d == 29
        self.m += 1
        self.d = 1
      else
        self.d += 1
      end
    else
      if self.d == 28
        self.m += 1
        self.d = 1
      else
        self.d += 1
      end
    end
  else 
    if self.d == 31
      self.m +=1
      self.d = 1
    else
      self.d +=1
    end
  end
  if self.m > 12
    self.y += 1
    self.m = 1
  end
  @@dotw = (@@dotw + 1) % 7
end

until( @day.y == 2000 && @day.m == 12 && @day.d == 31 ) do 
  @day.p if $DEBUG
  p @week[@@dotw] if @day.d == 1 if $DEBUG
  @day.next
end
p @@cnt

