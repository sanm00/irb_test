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
		second_value = nil
		nums.each_with_index do |value, index|
			tmp_nums = nums[index+1, nums.size-index]
			if second_value.nil? && tmp_nums.include?(target - value)
				first_index = index
				second_value = target - value
			end

			if !second_value.nil? && value == second_value
				second_index = index
				if second_index ==  first_index
					next
				end
				return [first_index, second_index]
			end
		end
	end

end
nums = [3,2,4,3]
target = 5

p TwoSum.new.two_sum_fun2(nums, target)
p TwoSum.new.two_sum_fun1(nums, target)
