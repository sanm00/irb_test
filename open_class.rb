# 实现1+1=3
class Fixnum
  alias_method :real_add, :+
  def +(x)
    # ------1--------
    real_add(x).succ
    # ------2--------
    # (self == 1 && x == 1) ? 3 : real_add(x)
  end

end