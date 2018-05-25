module BeforeAction
	def before_actoin(method_name, options)
		action_module= Module.new do
			options[:for].each do |method|
				send :define_method, method do |*args, &block|
					send method_name
					super(*args, &block)
				end
			end
		end

		prepend action_module
	end
end

class Speaker
	extend BeforeAction

	before_actoin :before_method, for: [:speaker, :a]

	def speaker
		p '00000000000000000'
	end

	def a(x)
		p "------>#{x}"
	end

	def b
		p 'bbbbbbb'
	end

	def before_method
		p '------------------'
	end
end

Speaker.new.a('qq')