require 'test_helper'

class TestSerializersJson < MiniTest::Test

  def setup
    @person = Person.new(SerializersJson)
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