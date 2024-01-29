#!/usr/bin/ruby
require 'irb/completion'
begin
  require 'irb/ext/save-history'
rescue LoadError
  # Ruby 3.3 changed this, but it's actually enabled by default
end

IRB.conf[:AUTO_INDENT]  = true
IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
# Access our previous X evaluations in an IRB console using double underscore `__`
IRB.conf[:EVAL_HISTORY] = 3

class Object
  # list methods which aren't in superclass
  def local_methods(obj = self)
    (obj.methods - obj.class.superclass.instance_methods).sort
  end

  # print documentation
  #
  #   ri 'Array#pop'
  #   Array.ri
  #   Array.ri :pop
  #   arr.ri :pop
  def ri(method = nil)
    unless method && method =~ /^[A-Z]/ # if class isn't specified
      klass = self.kind_of?(Class) ? name : self.class.name
      method = [klass, method].compact.join('#')
    end
    puts `ri '#{method}'`
  end
end

def copy(str)
  IO.popen('pbcopy', 'w') { |f| f << str.to_s }
end

def copy_history
  history = Readline::HISTORY.entries
  index = history.rindex("exit") || -1
  content = history[(index+1)..-2].join("\n")
  puts content
  copy content
end

def paste
  `pbpaste`
end

# Add color coding based on Rails environment for safety
# https://gist.github.com/swanson/3ca98caff43d52f62b4b99f6f2c7444c
if defined?(Rails) && defined?(Rails.env)
  banner = if Rails.env.production?
    "\e[41;97;1m #{Rails.env} \e[0m "
  else
    "\e[42;97;1m #{Rails.env} \e[0m "
  end

  # Build a custom prompt
  IRB.conf[:PROMPT][:CUSTOM] = IRB.conf[:PROMPT][:DEFAULT].merge(
    PROMPT_I: banner + IRB.conf[:PROMPT][:DEFAULT][:PROMPT_I],
  )

  # Use custom prompt by default
  IRB.conf[:PROMPT_MODE] = :CUSTOM
end
