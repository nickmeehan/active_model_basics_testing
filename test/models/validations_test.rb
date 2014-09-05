require 'test_helper'
require File.expand_path('../../../lib/validations', __FILE__)

class TestValidations < Minitest::Test

  def setup
    @person = Person.new(Validations)
    @person.token = "2b1f325"
  end

  def test_that_person_is_invalid_if_fields_are_missing
    assert_equal false, @person.valid?
  end

  def test_that_person_is_invalid_if_email_is_formatted_incorrectly
    @person.name = "vishnu"
    @person.email = "me"
    assert_equal false, @person.valid?
  end

  def test_that_person_is_valid_if_all_fields_are_valid
    @person.name = "vishnu"
    @person.email = "me@vishnuatrai.com"
    assert_equal true, @person.valid?
  end

  def test_that_person_raises_error_if_token_is_nil
    @person.token = nil
    assert_raises ActiveModel::StrictValidationFailed do
      @person.valid?
    end
  end

end