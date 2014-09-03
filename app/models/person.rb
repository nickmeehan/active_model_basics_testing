class Person

  def initialize(module_choice = nil)
    self.class.send(:include, module_choice) if !!module_choice
  end
  
end