#!/usr/bin/env ruby
# coding : utf-8
def date_adder
  @month += 1
  @day = 1
  if @month > 12
    @month = 1
    @year += 1
  end
end
@year = 1900
@month = 1
@day = 1
wday = [1, 2, 3, 4, 5, 6, 0] # 月曜始まり
count_sunday = 0
wday.cycle do |wd|
  if @year >= 1901 && @day == 1 && wd == 0
    count_sunday += 1
  end
  break if @year == 2000 && @month == 12 && @day == 1
  @day += 1
  if [4, 6, 9, 11].include?(@month)
    date_adder if @day == 31
  elsif [1, 3, 5, 7, 8, 10, 12].include?(@month)
    date_adder if @day == 32
  elsif @month == 2
    if @year % 4 == 0
      if @year % 400 != 0 && @year % 100 == 0
        date_adder if @day == 29
      else
        date_adder if @day == 30
      end
    else
      date_adder if @day == 29
    end
  end
end
p count_sunday
