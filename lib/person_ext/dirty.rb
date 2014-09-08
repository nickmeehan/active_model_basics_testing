require 'active_support/concern'

module PersonExt
  module Dirty
    extend ActiveSupport::Concern
    include ActiveModel::Dirty
    
    included do
      define_attribute_methods :first_name, :last_name
    end
   
    def first_name
      @first_name
    end
   
    def first_name=(value)
      first_name_will_change!
      @first_name = value
    end
   
    def last_name
      @last_name
    end
   
    def last_name=(value)
      last_name_will_change!
      @last_name = value
    end
   
    def save
      # do save work...
      changes_applied
    end
  end
end





# # QUERYING OBJECT DIRECTLY FOR ITS LIST OF ALL CHANGED ATTRIBUTES

# person = Person.new
# p person.changed? == false # => true
 
# person.first_name = "First Name"
# p person.first_name == "First Name" # => true
 
# # returns if any attribute has changed.
# p person.changed? == true # => true
 
# # returns a list of attributes that have changed before saving.
# p person.changed == ["first_name"] # => true
 
# # returns a hash of the attributes that have changed with their original values.
# p person.changed_attributes == {"first_name"=>nil} # => true
 
# # returns a hash of changes, with the attribute names as the keys, and the values will be an array of the old and new value for that field.
# p person.changes == {"first_name"=>[nil, "First Name"]} # => true


# # ATTRIBUTE BASED ACCESSOR METHODS

# # attr_name_changed?
# p person.first_name == "First Name" # => true
# p person.first_name_changed? == true # => true

# # attr_name_was accessor
# p person.first_name_was == "First Name" # => true

# # attr_name_change
# p person.first_name_change == [nil, "First Name"] # => true
# p person.last_name_change == nil # => true