require 'test_helper'
require File.expand_path('../../../lib/conversion', __FILE__)

class TestConversion < Minitest::Test

  def setup
    @person = Person.new(Conversion)
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