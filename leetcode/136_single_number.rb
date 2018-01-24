class SingleNumber
	# @param {Integer[]} nums
	# @return {Integer}
	# 一个整形数组，除一个元素外其他元素都出现过两次，找出这个元素

	def single_number(nums)
		return nums.first if nums.size == 1
		nums.sort!{|first, second| first <=> second}
		index = 0
		length = nums.size

		until index == length
			return nums[index] if nums[index+1].nil? || nums[index] != nums[index+1]
			index += 2 
		end
	end
end

