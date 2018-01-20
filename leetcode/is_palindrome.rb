class IsPalindrome
  MIN_INTEGER = -2147483648
  MAX_INTEGER = 2147483648
  # 负数不是回文数
  def is_palindrome(x)
    x >= 0 && x < MAX_INTEGER && x == x.to_s.reverse.to_i
  end
end