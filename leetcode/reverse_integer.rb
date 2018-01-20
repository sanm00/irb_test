class ReverseInteger
  MIN_INTEGER = -2147483648
  MAX_INTEGER = 2147483648
  def reverse(x)
    tmp_str = ''
    if x < 0
      x = -x
      tmp_str = '-'
    end
    tmp_x = (tmp_str + x.to_s.reverse).to_i
    if tmp_x < MIN_INTEGER || tmp_x > MAX_INTEGER
      tmp_x = 0
    end
    tmp_x
  end
end

p '-----------'
p ReverseInteger.new.reverse(1534236469)