# 使用Ruby内置的OptionParser库来处理命令行选项和参数，以及Readline库来处理交互式输入。

#!/usr/bin/env ruby

require 'optparse'
require 'readline'
require './chatgpt.rb'
$index = 0
# 定义命令行选项和参数
options = {}
helper = nil

OptionParser.new do |opts|
  opts.banner = "Usage: my_tool.rb [options]"

  opts.on("-o", "--open Tool", "open seach result by Tool") do |name|
    options[:tool] = name
  end

  opts.on("-h", "--help", "Prints this help") do
    puts opts
    exit
  end

  helper = opts
end.parse!

def start_tag(line_index)
  "chatgpt:#{line_index}> "
end

def welcome
  puts "#{start_tag($index += 1)}=================================="
  puts "#{start_tag($index += 1)}  Welcome to My ChatGpt Tool!"
  puts "#{start_tag($index += 1)}  输入想要搜索的内容，用`go`提交查询"
  puts "#{start_tag($index += 1)}=================================="
  puts "#{start_tag($index += 1)}"
end

# 欢迎信息
welcome

# 搜索字符串
search_content = ''

# 循环读取用户输入
i = $index
loop do
  i += 1
  input = Readline.readline(start_tag(i), true)

  # 处理用户输入
  case input.chomp
  when "hello"
    puts "Hello, #{options[:name]}!"
  when "age"
    puts "You are #{options[:age]} years old."
  when "exit", "quit"
    exit
  when ""
    next
  when "help", "-h"
    puts helper
  when 'go'
    i += 1
    unless search_content.empty?
      puts "#{start_tag(i)}正在查找 #{search_content} 的答案"
      open_by_mdcat(completion(search_content))
      search_content = ''
      puts "\n"
    else
      puts "#{start_tag(i)}#{'请输入想要搜索的信息'.red}"
    end
  when 'clear'
    i += 1
    search_content = ''
    puts "#{start_tag(i)}搜索内容已被清空\n"
  else
    search_content = search_content.empty? ? input : "#{search_content}, #{input}"
  end
end