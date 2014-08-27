require 'bundler'
Bundler.require

class Person
  extend ActiveModel::Callbacks
 
  define_model_callbacks :update
 
  before_update :reset_me
 
  def update
    run_callbacks(:update) do
      # This method is called when update is called on an object.
      p 'I ran in update under run_callbacks(:update)'
    end
  end
 
  def reset_me
    p 'I ran in reset_me'
    # This method is called when update is called on an object as a before_update callback is defined.
  end
end

person = Person.new
person.update