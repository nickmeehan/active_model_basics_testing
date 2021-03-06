require 'test_helper'
require 'person_ext/conversion'

class TestConversion < Minitest::Test

  def setup
    @person = Person.new(PersonExt::Conversion)
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