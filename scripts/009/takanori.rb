# encoding: utf-8
#
# Project Euler - Problem 9
#   ピタゴラスの三つ組(ピタゴラスの定理を満たす自然数)とはa<b<cで
#     a² + b² = c²
#   を満たす数の組である.
#   例えば, 3² + 4² = 9 + 16 = 25 = 5²である.
#   a + b + c = 1000となるピタゴラスの三つ組が一つだけ存在する. このa,b,cの積を計算しなさい.
#
total = 0

(1..1000).each { |a|
    ((a + 1)..1000).each { |b|
        c = 1000 - a - b
        if (a**2 + b**2) == c**2
            total = a * b * c
            break
        end
    }
}
puts total
