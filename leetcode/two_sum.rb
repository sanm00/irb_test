class TwoSum
	def two_sum_fun1(nums, target)
	  max_index = nums.size - 1
	  nums.each_with_index do |value, index|
	    ((index+1)..max_index).each do |last_index|
	      if value + nums[last_index] == target
	        return [index, last_index]
	      end
	    end
	  end
	end

	def two_sum_fun2(nums, target)
		first_index = nil
		second_index = nil
		nums.each_with_index do |value, index|
			if !second_value.present? && nums.include?(target - value)
				first_index = index
				second_value = target - value
			end
      
      if second_value.present? && value == second_value
      	second_index = index
      	return [first_index, second_index]
      end 
		end
	end
end
