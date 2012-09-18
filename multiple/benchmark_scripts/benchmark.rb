require 'stringio'

def capture_stdout
  out = StringIO.new
  $stdout = out
  yield
  return out
ensure
  $stdout = STDOUT
end

file_path = ARGV[0]
if file_path.nil?
  puts "999.999\nERROR SCRIPT NOT FOUND"
  exit
end
ctx = File.read(file_path, :encoding => Encoding::UTF_8)
@finish = 0
stdout = capture_stdout do
  start = Time.now
  eval ctx
  @finish = Time.now - start
end
puts @finish
puts stdout.string
