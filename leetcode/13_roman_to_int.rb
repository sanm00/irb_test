# 把1-3999的罗马数组转换为阿拉伯数组
# @param {String} s
# @return {Integer}
# 罗马数字采用七个罗马字母作数字、即Ⅰ（1）、X（10）、C（100）、M（1000）、V（5）、L（50）、D（500）
# 所有字符值加起来，如果某个字符比右边的小，减去它的二倍
class RomanToInt
  def roman_to_int(s)
    basic_map = {
      'I' => 1,
      'X' => 10,
      'C' => 100,
      'M' => 1000,
      'V' => 5,
      'L' => 50,
      'D' => 500
    }

    previous = s[0]
    sum = 0
    s.each_char do |char|
      sum += basic_map[char]

      if  basic_map[char] > basic_map[previous]
        sum -= basic_map[previous]*2
      end
      previous = char
    end
    sum
  end

end
p '------------'
p RomanToInt.new.roman_to_int('MCMXCVI')
# 1996