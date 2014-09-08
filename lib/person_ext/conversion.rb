require 'active_support/concern'

module PersonExt
  module Conversion
    extend ActiveSupport::Concern
    include ActiveModel::Conversion
   
    def persisted?
      false
    end
   
    def id
      nil
    end
  end
end

 
# # person = Person.new
# # p (person.to_model == person) == true  # => true
# # p person.to_key == nil                 # => nil
# # p person.to_param == nil               # => nil