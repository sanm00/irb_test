class Tree
	# Definition for a binary tree node.
	# class TreeNode
	#     attr_accessor :val, :left, :right
	#     def initialize(val)
	#         @val = val
	#         @left, @right = nil, nil
	#     end
	# end

	# @param {TreeNode} p
	# @param {TreeNode} q
	# @return {Boolean}
	# 二叉树的遍历
	def is_same_tree(p, q)
		p_datas = ergodic(p)
		q_datas = ergodic(q)
		p_datas.eql?(q_datas)
	end

	def ergodic(node, datas = [])
		datas << nodes.val
		if !node.nil?
			send(__method__, node.left)
			send(__method__, node.right)
		end
	end
end


