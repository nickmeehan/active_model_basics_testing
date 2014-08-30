# require 'minitest/autorun'
# require 'bundler'
# Bundler.require

# class Person
#   include ActiveModel::Serialization
 
#   attr_accessor :name
 
#   def attributes
#     {'name' => nil}
#   end
# end

# class TestPerson < MiniTest::Test

#   def setup
#     @person = Person.new
#   end

#   def test_that_serializable_hash_returns_correct_value_after_initialization
#     assert_equal({"name"=>nil}, @person.serializable_hash)
#   end

#   def test_that_serializable_hash_returns_correct_value_after_attribute_value_changes
#     @person.name = "Bob"
#     assert_equal({"name"=>"Bob"}, @person.serializable_hash)
#   end

# end

# # person = Person.new
# # p person.serializable_hash == {"name"=>nil}     # => true
# # person.name = "Bob"
# # p person.serializable_hash == {"name"=>"Bob"}   # => true