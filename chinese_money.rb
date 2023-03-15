module ChineseMoney
  CHINESESYMBOL = {0=>'零', 1=>'壹', 2=>'贰', 3=>'叁', 4=>'肆', 5=>'伍', 6=>'陆', 7=>'柒', 8=>'捌', 9=>'玖'} 
  INTUNITS = {0=>'圆', 1=>'拾', 2=>'佰', 3=>'仟', 4=>'万', 5=>'拾', 6=>'佰', 7=>'仟', 8=>'亿', 9=>'拾', 10=>'佰', 11=>'仟', 12=>'兆', 13=>'拾', 14=>'佰', 15=>'仟'}
  CHANGEUNITS = {0=>'角', 1=>'分'}
  def self.show_money(money)
    tmp_money = money.to_s.gsub(' ', '').gsub(',', '')
    return '零元零角零分' if tmp_money.to_f.zero?

    int_money, change_money = tmp_money.split('.')
    chinese_money = ''

    int_money = int_money.empty? ? '0' : int_money
    (0..(int_money.size - 1)).each do |i|
      chinese_money += "#{CHINESESYMBOL[int_money[i].to_i]}#{INTUNITS[int_money.size-1-i]}"
    end
  
    change_money ||= '00'
    change_money += '0' * (2-change_money.to_s.size) if change_money.to_s.size < 2
    (0..(change_money.size - 1)).each do |i|
      chinese_money += "#{CHINESESYMBOL[change_money[i].to_i]}#{CHANGEUNITS[i]}"
    end
  
    chinese_money
  end
end

puts ChineseMoney.show_money(100101.01)