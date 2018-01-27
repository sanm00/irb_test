# 扩展present?和blank?
module MyTest
  def blank?
    nil? || (respond_to?(:empty?) && empty?)
  end

  def present?
    !blank?
  end
end

class Object
  include MyTest
end

class Test
  def test
    p '------------'
    p ''.blank?
    p [].present?
  end

  Test.new.test
end