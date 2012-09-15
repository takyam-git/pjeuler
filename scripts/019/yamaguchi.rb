# encoding: utf-8
#Problem 19 †
#次の情報が与えられている。
#
#1900年1月1日は月曜日である。
#9月、4月、6月、11月は30日まであり、2月を除く他の月は31日まである。
#2月は28日まであるが、うるう年のときは29日である。
#うるう年は西暦が4で割り切れる年に起こる。しかし、西暦が400で割り切れず100で割り切れる年はうるう年でない。
#20世紀（1901年1月1日から2000年12月31日）で月の初めが日曜日になるのは何回あるか。

year = 1900
month = 1
date = 1
day = 1
sun_cnt = 0
limit = 31
while true do
  if day == 7
    if date == 1 and year > 1900
      sun_cnt += 1
      p "#{year}/#{month}"
    end
    day = 0
  end

  date = 0 if limit == date

  if date == 0 #next month
    if month < 12
      month += 1
      case month
        when 2
          if year % 4 != 0 or ( year % 400 != 0 and year % 100 == 0 )
            limit = 28
          else
            limit = 29
          end
        when 9, 4, 6, 11
          limit = 30
        else
          limit = 31
      end
    else

      if year == 2000
        break
      end

      month = 1
      year += 1
      limit = 31
    end
  end

  date += 1
  day += 1
end

p sun_cnt