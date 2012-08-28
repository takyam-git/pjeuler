case_cnt = 9 * 8 * 7 * 6 * 5 * 4
total = 0
orig = [1, 2, 3, 4, 5, 6, 7, 8, 9]

(1..4).each do |x1|
  arr1 = orig.dup
  arr1.delete_at(x1 - 1)
  arr1.each_index do |i2|
    arr2 = arr1.dup
    x2 = arr2.delete_at(i2)
    arr2.each_index do |i3|
      arr3 = arr2.dup
      x3 = arr3.delete_at(i3)
      catch :next_parent do
        parent_case = 120
        arr3.each_index do |i4|
          arr4 = arr3.dup
          x4 = arr4.delete_at(i4)
          arr4.each_index do |i5|
            arr5 = arr4.dup
            x5 = arr5.delete_at(i5)
            arr5.each_index do |i6|
              arr6 = arr5.dup
              x6 = arr6.delete_at(i6)

              child  = 200 * x1 + 20 * x2 + 2 * x3
              parent = 100 * x4 + 10 * x5 + x6

              if child < parent
                total += parent_case
                throw :next_parent
              end
              parent_case -= 1

            end
          end
        end
      end
    end
  end
end

printf "%2.2f \%\n",  ( total.to_f / case_cnt * 100 )
