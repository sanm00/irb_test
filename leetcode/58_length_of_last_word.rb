class LengthOfLastWord
	给一个含有空格的字符串，求以空格分割的最后一个字符串的长度
	# @param {String} s
	# @return {Integer}
	def length_of_last_word(s)
  	return 0 if s.size.zero?
  	(s.split(' ').last || '').size
	end
end