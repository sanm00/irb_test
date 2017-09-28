class Fact
  def fact n
    if n == 0
      1
    else
      n * send(__method__, n-1)
    end  
  end
  puts '---------------------'
  puts  Fact.new.fact 3
end
