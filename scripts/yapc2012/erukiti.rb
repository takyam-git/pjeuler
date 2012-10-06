#! /usr/bin/env ruby
#coding: utf-8

PARTITION = 5000

def get_primary(nums)
  sleve = []
  result = [2]
  nums -= 1
  primary = 2
  max = PARTITION
  while nums > 0
    n = primary
    while n < max
      sleve[n] = true
      n += primary
    end

    while sleve[primary] && primary < max
      primary += 1
    end

    if primary >= max
      index = 0
      while result[index] ** 2 <= max + PARTITION
        prim = result[index]
        n = max / prim * prim
        while n < max + PARTITION
          sleve[n] = true
          n += prim
        end
        index += 1
      end
      max += PARTITION

      while sleve[primary]
        primary += 1
      end
    end

    result << primary
    nums -= 1
  end

  result
end

#if __FILE__ == $0
  puts get_primary(10000).inject(:+)
#end

