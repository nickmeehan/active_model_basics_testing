require 'test_helper'
require 'person_ext/attribute_methods'
 
class TestAttributeMethods < Minitest::Test

  def setup
    @person = Person.new(PersonExt::AttributeMethods)
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