require 'minitest/autorun'
require 'bundler'
Bundler.require

class Person
  include ActiveModel::AttributeMethods
 
  attribute_method_prefix 'reset_'
  attribute_method_suffix '_highest?'
  define_attribute_methods 'age'
 
  attr_accessor :age
 
  private
    def reset_attribute(attribute)
      send("#{attribute}=", 0)
    end
 
    def attribute_highest?(attribute)
      send(attribute) > 100
    end
end


class TestPerson < Minitest::Test

  def setup
    @person = Person.new
  end

  def test_that_person_age_is_highest
    @person.age = 110
    assert_equal true, @person.age_highest?
  end

  def test_that_reset_age_returns_zero
    assert_equal 0, @person.reset_age
  end

  def test_that_person_age_is_not_highest_after_age_reset
    @person.reset_age
    assert_equal false, @person.age_highest?
  end

end
 

# person = Person.new
# person.age = 110
# person.age_highest? == true   # true
# p person.reset_age == 0         # true
# p person.age_highest? == false  # true