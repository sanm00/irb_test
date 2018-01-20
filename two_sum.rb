def two_sum(nums, target)
  max_index = nums.size - 1
  nums.each_with_index do |value, index|
    ((index+1)..max_index).each do |last_index|
      if value + nums[last_index] == target
        return [index, last_index]
      end
    end
  end
end