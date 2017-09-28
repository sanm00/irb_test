class Fact
  # 体验send 实现递归
  # 阶乘
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
