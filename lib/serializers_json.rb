require 'active_support/concern'


module SerializersJson
  extend ActiveSupport::Concern
  include ActiveModel::Serializers::JSON
 
  attr_accessor :name
  
  included do
    def attributes=(hash)
      hash.each do |key, value|
        send("#{key}=", value)
      end
    end
   
    def attributes
      {'name' => nil}
    end
  end
end



# # person = Person.new
# # p person.as_json == {"name"=>nil}   # => true
# # person.name = "Bob"
# # p person.as_json == {"name"=>"Bob"} # => true

# # json = { name: 'Bob' }.to_json
# # person = Person.new
# # p person.from_json(json) == person  # => true
# # p person.name == "Bob"              # => true