require 'test_helper'

class TestSerialization < MiniTest::Test

  def setup
    @person = Person.new(Serialization)
  end

  def test_that_serializable_hash_returns_correct_value_after_initialization
    assert_equal({"name"=>nil}, @person.serializable_hash)
  end

  def test_that_serializable_hash_returns_correct_value_after_attribute_value_changes
    @person.name = "Bob"
    assert_equal({"name"=>"Bob"}, @person.serializable_hash)
  end

end