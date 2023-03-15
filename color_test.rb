class String
  COLORS = {
    black: "\e[30m",
    red: "\e[31m",
    green: "\e[32m",
    yellow: "\e[33m",
    blue: "\e[34m",
    magenta: "\e[35m",
    cyan: "\e[36m",
    white: "\e[37m"
  }

  def colorize(color)
    "#{COLORS[color.to_sym]}#{self}\e[0m"
  end
end

puts "This is red".colorize(:red)
puts "This is green".colorize(:green)
puts "This is yellow".colorize(:yellow)
puts "This is blue".colorize(:blue)
puts "This is magenta".colorize(:magenta)
puts "This is cyan".colorize(:cyan)
puts "This is white".colorize(:white)