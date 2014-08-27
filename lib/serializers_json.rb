require 'minitest/autorun'
require 'bundler'
Bundler.require

class Person
  include ActiveModel::Serializers::JSON
 
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
    @json = { name: "Bob" }.to_json
  end

  def test_that_as_json_hash_returns_correct_value_after_initialization
    assert_equal({"name"=>nil}, @person.as_json)
  end

  def test_that_as_json_hash_returns_correct_value_after_attribute_value_changes
    @person.name = "Bob"
    assert_equal({"name"=>"Bob"}, @person.as_json)
  end

  def test_that_from_json_assigns_correct_attributes_to_instance
    assert_equal @person, @person.from_json(@json)
    assert_equal "Bob", @person.name
  end

end

# person = Person.new
# p person.as_json == {"name"=>nil}   # => true
# person.name = "Bob"
# p person.as_json == {"name"=>"Bob"} # => true

# json = { name: 'Bob' }.to_json
# person = Person.new
# p person.from_json(json) == person  # => true
# p person.name == "Bob"              # => true