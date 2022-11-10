class String
  def blue
    return "\033[34m #{self}\033[0m"
  end
  def red
    return "\033[31m #{self}\033[0m"
  end
  def green
    return "\033[32m #{self}\033[0m"
  end
  def yellow
    return "\033[33m #{self}\033[0m"
  end
  def magenta
    return "\033[35m #{self}\033[0m"
  end
  def cyan
    return "\033[36m #{self}\033[0m"
  end
end

puts '1111'.red