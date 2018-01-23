class ClimbStairs
	# @param {Integer} n
	# @return {Integer}
	# n代表台阶数
	# 每次可以走一个台阶或两个台阶，求走完台阶的方法数
	# 台阶数 --> 步数 
	# 1            1
	# 2            2
	# 3            3
	# 4            5
	# 5            8
	# 8           13
	def climb_stairs(n)
	  return 0 if n == 0
	  return 1 if n == 1
		return 2 if n == 2

		first_lines  = 1
		second_lines = 2
		this_lines = 0

		(3..n).each do |time|
			this_lines = first_lines + second_lines
			first_lines = second_lines
			second_lines = this_lines
		end
		this_lines
	end

	p '---------'
	p ClimbStairs.new.climb_stairs(6)
end