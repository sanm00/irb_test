# @param {String} haystack
# @param {String} needle
# @return {Integer}
# 求一个字符串是否包含另外一个字符串，是则返回字符串第一次出现的位置，否责返回-1
def str_str(haystack, needle)
	(haystack.index needle).nil? ? -1 :  (haystack.index needle)
end