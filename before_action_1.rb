module BeforeAction
  def self.included(klass)
    klass.extend(ClassMethods)
  end

  module ClassMethods
    def before_action(method_name, options)
      p '------'
      p options
      p method_name
      action_module = Module.new do
        send :define_method, options[:for] do |*args, &block|
          p '0000000000'

          send method_name

          super(*args, &block)
        end
      end

      prepend action_module
    end
  end
end

class Speaker
  include BeforeAction

  before_action :chinese_self_intro, for: :speak

  def speak
    puts 'I am speaking...'
  end

  def speak_a
    puts 'aaaaa'
  end

  private

  def chinese_self_intro
    puts 'Hello, I come from china.'
  end
end

p Speaker.ancestors
Speaker.new.speak_a