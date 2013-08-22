# coding : utf-8
i = 123456
loop do
	s = i.to_s
	if s.scan(/#{(i*2).to_s.split('')}/).length == 6 and
		s.scan(/#{(i*3).to_s.split('')}/).length == 6 and
		s.scan(/#{(i*4).to_s.split('')}/).length == 6 and
		s.scan(/#{(i*5).to_s.split('')}/).length == 6 and
		s.scan(/#{(i*6).to_s.split('')}/).length == 6 
		p i
		break
	end
	i += 1
end
