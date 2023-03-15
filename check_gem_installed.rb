def check!(gem_name, v_limit = nil)
  gem(gem_name, v_limit)
end

def check(gem_name, v_limit = nil)
  begin
    check!(gem_name, v_limit)
  rescue Gem::MissingSpecError
    false
  end
end

puts check('caxlsx', '>1')