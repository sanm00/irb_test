# 用于构建命令行工具，它提供了一组简单的 API，可用于定义命令行选项、参数、子命令等。

require 'thor'

class CLI < Thor
  package_name "CLI"
  map '-H' => 'hello'
  map '-h' => 'help'
  map '-q' => 'quest'

  desc "hello [NAME]", "Say hello to NAME"
  method_options :alias => "-h"  
  def hello(name)
    puts "Hello, #{name}!"
  end

  desc "quest [question]", "quest some question"
  def quest
    print '>'
    str = $stdin.gets
  end

  # desc "loading", "my loading"
  # def loading
  #   t = 0
  #   loop do
  #     break if t > 100
  #     [' | ', ' / ', ' - ', ' \ '].each do |c|
  #       print c
  #       $stdout.flush
  #       sleep 0.3
  #       print "\b\b\b" # 光标退回到上一个输出位置
  #     end

  #     t += 1
  #   end
  # end
end

CLI.start(ARGV)