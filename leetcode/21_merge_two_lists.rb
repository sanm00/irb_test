# Definition for singly-linked list.

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
# 有序合并两个链表
module MergeTwoList
	class ListNode
	  attr_accessor :val, :next
	  def initialize(val)
	      @val = val
	      @next = nil
	  end
	end

  def self.merge_two_lists(l1, l2)
    return l2 if l1.nil?
    return l1 if l2.nil?

    if l1.val < l2.val
    	l1.next = send(__method__, l1.next, l2)
    	return l1
    else l1.val > l2.val
    	l2.next = send(__method__, l2.next, l1)
    	return l2
    end
  end

  l1 = ListNode.new(2)
  l2 = ListNode.new(1)

  l1.next = ListNode.new(4)
  l2.next = ListNode.new(3)

  p '--------'
  p  MergeTwoList::merge_two_lists(l1, l2)
end
