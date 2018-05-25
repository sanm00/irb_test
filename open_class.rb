# 实现1+1=3
# -----------1.取别名 begin-------------
class Integer
  alias_method :real_add, :+
  def +(x)
    # ------1--------
    real_add(x).succ
    # ------2--------
    # (self == 1 && x == 1) ? 3 : real_add(x)
  end
end
# -----------1.取别名 end-------------

# -----------2.细化 begin-------------
module MyInteger
	refine Integer do
		def +(x)
			(self == 1 && x == 1) ? 3 : super
		end
	end
end

using MyInteger
# -----------2.细化 end-------------


# -----------3.使用prepend----------
module PreInteger
	def +(x)
		(self == 1 && x == 1) ? 3 : super
	end
end

Integer.class_eval do
	prepend PreInteger
end
# -----------3.使用prepend end----------