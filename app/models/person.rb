require 'bundler'
Bundler.require

class Person

  def initialize(module_choice = nil)
    self.class.send(:include, module_choice) if !!module_choice
  end
  
  extend ActiveModel::Translation
end


# p Person.human_attribute_name('name') # => "Nome"