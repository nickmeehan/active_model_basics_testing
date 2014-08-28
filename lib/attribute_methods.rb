require 'active_support/concern'

module AttributeMethods
  extend ActiveSupport::Concern
  include ActiveModel::AttributeMethods

  attr_accessor :age
 
  included do
    attribute_method_prefix 'reset_'
    attribute_method_suffix '_highest?'
    define_attribute_methods 'age'
  end  

  def reset_attribute(attribute)
    send("#{attribute}=", 0)
  end

  def attribute_highest?(attribute)
    send(attribute) > 100
  end
 
end