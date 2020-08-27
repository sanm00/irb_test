# 简单敏感词过滤

class FilterSensitiveWord
  Word = Struct.new(:is_end, :value)

  attr_accessor :words, :hash

  def initialize
    @hash  = Hash.new
    @words = ['成人电影', '色情电影', '小电影']
    init_map(@words)
  end

  def init_map(words)
    words.each do |word|
      word_hash = hash

      _word = word.strip
      word_length = _word.length

      (1..word_length).each do |i|
        c = _word[i-1]
        if word_hash[c].nil?
          if i == word_length
            word_hash[c] = Word.new(true, Hash.new)
          else
            word_hash[c] = Word.new(false, Hash.new)
            word_hash = word_hash[c].value
          end
        else
          word_hash = word_hash[c].value
        end
      end
    end

    hash
  end

  def scan(text = '', sensitive_words = [], sensitive_hash = hash, temp_text = '')
    c = text[0]
    return sensitive_words if text.empty?
    return sensitive_words if c.empty?

    text_size = text.length
    w = sensitive_hash[c]

    if w.nil?
      if temp_text.size > 0
        new_text = temp_text + text
        new_length = new_text.length
        text = new_text[1..(new_length-1)]
      else
        text = text[1..(text_size-1)]
      end
      temp_text = ''
      send(__method__, text, sensitive_words)
    else
      temp_text += c
      text = text[1..(text_size-1)]
      if w.is_end
        sensitive_words.push(temp_text)
        send(__method__, text, sensitive_words)
      else
        send(__method__, text, sensitive_words, w.value, temp_text)
      end
    end
  end

  def statistics(sensitive_words)
    s = {}
    sensitive_words.each do |w|
      if s[w].nil?
        s[w] = 1
      else
        s[w] = s[w] + 1
      end
    end
    s
  end

  def gsub_text(text)
    text.strip.gsub(/[`~!@#$^&*()=|{}':;',\\\[\]\.<>\/?~！@#￥……&*（）——|{}【】'；：""'。，、？]|\s/,'')
  end
end