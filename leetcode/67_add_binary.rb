class AddBinary
	# # @param {String} a
	# @param {String} b
	# @return {String}
	# 给定两个二进制字符串，返回它们的总和（也是一个二进制字符串）
	def add_binary(a, b)
		a.reverse!
		b.reverse!
		(smaller,bigger) = (a.size > b.size) ? [b, a] : [a, b]
		new_str = bigger
		carry_flag     = 0

		(0..(smaller.size-1)).each do |i|
			p a[i]
			new_str[i] = (a[i].to_i + b[i].to_i + carry_flag) % 2).to_s
			carry_flag = (a[i].to_i + b[i].to_i + carry_flag) / 2
		end

		if !carry_flag.zero?
			new_str[smaller.size] = carry_flag + bigger[smaller.size].to_i
		end
		new_str.reverse
	end

	p '-------'
	a = '110'
	b = '1'
	p AddBinary.new.add_binary(a, b)
end