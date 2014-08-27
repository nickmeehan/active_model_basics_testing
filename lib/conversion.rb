require 'minitest/autorun'
require 'bundler'
Bundler.require

class Person
  include ActiveModel::Conversion
 
  def persisted?
    false
  end
 
  def id
    nil
  end
end

class TestPerson < Minitest::Test

  def setup
    @person = Person.new
  end

  def test_that_person_to_model_is_person
    assert_equal @person, @person.to_model
  end

  def test_that_person_to_key_is_nil
    assert_equal nil, @person.to_key
  end

  def test_that_person_to_param_is_nil
    assert_equal nil, @person.to_param
  end

end
 
# person = Person.new
# p (person.to_model == person) == true  # => true
# p person.to_key == nil                 # => nil
# p person.to_param == nil               # => nil