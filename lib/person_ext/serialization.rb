
module PersonExt
  module Serialization
    include ActiveModel::Serialization
   
    attr_accessor :name
   
    def attributes
      {'name' => nil}
    end
  end
end

# # person = Person.new
# # p person.serializable_hash == {"name"=>nil}     # => true
# # person.name = "Bob"
# # p person.serializable_hash == {"name"=>"Bob"}   # => true