data = <<-"EOD"
75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
EOD
@ary = data.split(/\n/).map{|l| l.split(/\s/).map{|n| n.to_i}}
@selected = Array.new

# 再帰でたどる by honma
def search_route(mnt, route, list, position = [0, 0])
  if (mnt.length) -1 == (position[0]) # 最後の行
    route << list
    list = []
    position = [0, 0]
    return
  end
  (position[1]..(position[1])+1).each do |m|
    search_route(mnt, route, list + [mnt[position[0] + 1][m]], [position[0] + 1, m])
  end
  return route
end

# @selected の最後から選択する(しなおす)
def choose(ary_part)
  row_start_from = (@selected.size) - 1
  # pos は@selectedの最後の要素の位置
  pos = ary_part[row_start_from].index(@selected[-1]) || 0

  # mnt_relative は、@selectedの最後から選択しうる山
  mnt_relative = Array.new
  (row_start_from .. (ary_part.size)-1).each do |n|
    mnt_relative << ary_part[n][pos .. pos + (n - row_start_from)]
  end
  puts "mnt_relative: " + mnt_relative.to_s if $DEBUG
  route = Array.new
  route = search_route(mnt_relative, route, [@selected[-1]])
  puts "routes: " + route.to_s if $DEBUG
  max_route = []
  max = 0
  route.each do |r|
    s = r.inject(0){|s, n| s += n}
    if s > max
      max = s
      max_route = r
    end
  end
  puts "max_route: " + max_route.to_s if $DEBUG
  # max_route を@selected に追加
  # max_route の先頭は@selected の最後と同じなので1個shift
  max_route.shift
  max_route.each do |n|
    @selected << n
  end
  puts "selected: " + @selected.to_s if $DEBUG
end

ary_part = Array.new
@selected << 75
ary_part << @ary[0]
#ary_part << @ary[1]
(1..14).each do |n|
  ary_part << @ary[n]
  choose(ary_part)
  # ここで、行のmaxじゃない時に、どこまで戻るかのロジックが必要
  # ここをブラッシュアップできれば何行でも解ける！
  if @ary[n].max != @selected[-1] && diff = @ary[n].max - @selected[-1]
    puts "diff: " + diff.to_s if $DEBUG
    # とりあえず2行分消して再選択
    @selected.pop
    @selected.pop
    choose(ary_part)
  end
end

p @selected.inject(0){|s,n| s += n}
p @selected
