# coding : utf-8
#125874を2倍すると251748となる. これは元の数125874と順番は違うが同じ数を含む.
#2x, 3x, 4x, 5x, 6x が x と同じ数を含むような最小の正整数 x を求めよ.
i = 123456
loop do
	i += 1
	str = i.to_s.split('').sort.join
	 if (i*2).to_s.split('').sort.join == str &&
		 (i*3).to_s.split('').sort.join == str &&
		 (i*4).to_s.split('').sort.join == str &&
		 (i*5).to_s.split('').sort.join == str &&
		 (i*6).to_s.split('').sort.join == str
		 p i
		 break
	 end
end

