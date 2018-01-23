class SearchInsert
	# @param {Integer[]} nums
	# @param {Integer} target
	# @return {Integer}
	# 找到给定元素在有序数组中的位置
	# 如果在数组中找不到，找到元素按排序规则因该插入的位置
	def search_insert(nums, target)
	  tmp_key = nil
	  nums.each_with_index do |value, index|
	    if value == target || value > target
	      return index
	    end
	  end
	  nums.size
	end
end