# require 'yaml'

def chain(h={}, root = '', _c = [])
  return _c if h.nil? || h.empty?
  h.each do |k, v|
    _root = root.empty? ? k : "#{root}.#{k}"

    if v.is_a?(Hash)
      send(__method__, v, _root, _c)
    else
      _c << _root
    end
  end

  _c
end

aa = {:a=>{:b=>{:c=>1}, :b1=>{:c1=>2}}}
bb = {a: 1}
p chain(aa, bb)