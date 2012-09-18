#encoding: utf-8
#日をループじゃないパターン
year = 1900
month = 1
day = 1
cnt = 0
while true

  if year > 1900 and day == 7
    cnt += 1
  end

  case month
    when 2
      if !(year % 4 != 0 or (year % 400 != 0 and year % 100 == 0))
        day += 1 #うるう年は 29 / 7 = 4 余り 1 なので+1曜日
        # うるう年じゃない場合は 28/7=4余り０なので加算せず
      end
    when 4,6,9,11
      day += 2 #30/7 = 4 余り２ なので +2 曜日
    else
      day += 3 #31/7 = 4 余り 3 なので +3 曜日
  end

  if month == 12
    month = 1
    year += 1

    break if year > 2000
  else
    month += 1
  end

  day = day - 7 if day > 7

end

p cnt