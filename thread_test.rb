require 'thread'

t1, t2, t3 = nil, nil, nil

def download
  sleep rand(5..10)
end

t1 = Thread.new do
  t = Time.now
  download

  t2.raise "STOP"
  t3.raise "STOP"

  puts "t1 download done."
rescue
  puts "abort t1"
ensure
  # teardown
  puts "t1 duration: #{Time.now - t}"
end


t2 = Thread.new do
  t = Time.now
  download

  t1.raise "STOP"
  t3.raise "STOP"

  puts "t2 download done."
rescue
  puts "abort t2"
ensure
  # teardown
  puts "t2 duration: #{Time.now - t}"
end

t3 = Thread.new do
  t = Time.now
  download

  t1.raise "STOP"
  t2.raise "STOP"

  puts "t3 download done."
rescue
  puts "abort t3"
ensure
  # teardown
  puts "t3 duration: #{Time.now - t}"
end

[t1, t2, t3].map(&:join)