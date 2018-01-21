# @param {String[]} strs
# @return {String}
# 找到字符串数组中最大的公共前缀字符串
class LongsetCommonPrefix
	def longest_common_prefix(strs)
		return '' if strs.size.zero?
		strs.uniq!
		strs.sort!{|first, last| first.size <=> last.size}

		common_str = strs.first
		(strs - [common_str]).each do |str|
			return '' if common_str.size.zero?
			tmp_str_index  = 0
			tmp_common_str = ''
			common_str.each_char do |char|
				break if char != str[tmp_str_index]
				tmp_common_str += char
				tmp_str_index += 1
			end
			common_str = tmp_common_str
		end
		common_str
	end

	p '---------'
	strs = ['23', '23']
	p LongsetCommonPrefix.new.longest_common_prefix(strs)
end