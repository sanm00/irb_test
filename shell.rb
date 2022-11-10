#!/usr/bin/ruby
unless ARGV[0]
  puts "请输入内容 例如 ruby shell.rb <hello world>"
  str=STDIN.gets.chomp
  # exit
else
  str = ARGV[0]
end

# str = ARGV[0]
puts '======================='
puts str
# system("ps -ef | grep spring")