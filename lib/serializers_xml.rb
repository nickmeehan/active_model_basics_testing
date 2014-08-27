require 'minitest/autorun'
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

class TestPerson < MiniTest::Test

  def setup
    @person = Person.new
    @xml = { name: "Bob" }.to_xml
  end

  def test_that_to_xml_hash_returns_correct_value_after_initialization
    assert_equal("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<person>\n  <name nil=\"true\"/>\n</person>\n", @person.to_xml)
  end

  def test_that_to_xml_hash_returns_correct_value_after_attribute_value_changes
    @person.name = "Bob"
    assert_equal("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<person>\n  <name>Bob</name>\n</person>\n", @person.to_xml)
  end

  def test_that_from_xml_assigns_correct_attributes_to_instance
    assert_equal @person, @person.from_xml(@xml)
    assert_equal "Bob", @person.name
  end

end

# person = Person.new
# p person.to_xml == "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<person>\n  <name nil=\"true\"/>\n</person>\n"  # => true
# person.name = "Bob"
# p person.to_xml == "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<person>\n  <name>Bob</name>\n</person>\n"     # => true

# xml = { name: 'Bob' }.to_xml
# person = Person.new
# p person.from_xml(xml) == person  # => true
# p person.name == "Bob"            # => true