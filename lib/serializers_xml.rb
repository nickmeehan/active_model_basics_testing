require 'bundler'
Bundler.require

class Person
  include ActiveModel::Serializers::Xml
 
  attr_accessor :name
 
  def attributes=(hash)
    hash.each do |key, value|
      send("#{key}=", value)
    end
  end
 
  def attributes
    {'name' => nil}
  end
end


person = Person.new
p person.to_xml == "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<person>\n  <name nil=\"true\"/>\n</person>\n"  # => true
person.name = "Bob"
p person.to_xml == "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<person>\n  <name>Bob</name>\n</person>\n"     # => true

xml = { name: 'Bob' }.to_xml
person = Person.new
p person.from_xml(xml) == person  # => true
p person.name == "Bob"            # => true