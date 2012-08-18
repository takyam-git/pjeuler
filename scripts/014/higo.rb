# encoding: utf-8
start = Time.now
@a = Hash.new(0)
@a[1] = 1

def calc(n) 
  return @a[n] if @a[n] != 0
  m = n.even? ? n/2 : 3 * n + 1
  if @a[m] != 0
    @a[n] = @a[m] + 1
  else
    @a[n] = calc(m) + 1
  end
  # nになる数も埋めておく
  if n.even?
    if @a[ o = 2*n ] == 0 then @a[o] = @a[n] + 1 end
  else
    if ( (n-1) % 3 ) == 0 && @a[ o = (n-1)/3 ] == 0 then @a[o] = @a[n] + 1 end
  end
  return @a[n]
end

(1..999_999).each{|n|
  if @a[n] != 0 
    #puts "exists:#{n}"
    next
  else
    #puts "calc:#{n}"
    calc(n)
    #print "took " + ((Time.now - start) * 1000).round.to_s + "ms.\n"
  end
}

# 100万未満のstepの最大値
max_index  = 0
(1..1_000_000).each{|n| max_index = n if @a[n] > @a[max_index] }
p max_index
puts "max_index(under 1m): " + max_index.to_s + " 長さ: " + @a[max_index].to_s

# 以下は@a全体
#puts "max_index: " + @a.inject(0){|max,(k,v)| max < k ? k : max }.to_s
#puts "max_step: " + step = @a.inject(0){|max,(k,v)| max < v ? v : max }.to_s
#puts "num of not nil: " + @a.size.to_s
#puts "max_at: " + @a.index(step.to_i).to_s
print "took " + ((Time.now - start) * 1000).round.to_s + "ms.\n"
#@a.each{|k,v| print "#{k}:#{v} "}
