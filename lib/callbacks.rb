require 'active_support/concern'


module Callbacks
  extend ActiveSupport::Concern
  included do
    extend ActiveModel::Callbacks
    define_model_callbacks :update
    before_update :reset_me
  end
 
  def update
    run_callbacks(:update) do
      # This method is called when update is called on an object.
      return 'I ran in update under run_callbacks(:update)'
    end
  end
 
  def reset_me
    p 'I ran in reset_me when update was called'
    # This method is called when update is called on an object as a before_update callback is defined.
  end
end