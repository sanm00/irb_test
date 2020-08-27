#!/usr/bin/ruby
unless ARGV[0]
  puts "请输入内容 例如 ruby shell.rb <hello world>"
  # exit
end

str=STDIN.gets.chomp

# str = ARGV[0]
puts '======================='
puts str