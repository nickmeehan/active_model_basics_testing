require 'minitest/autorun'
require 'bundler'
Bundler.require

class Person
  include ActiveModel::Validations

  attr_accessor :name, :email, :token
 
  validates :name, presence: true
  validates_format_of :email, with: /\A([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})\z/i
  validates! :token, presence: true
end

class TestPerson < Minitest::Test

  def setup
    @person = Person.new
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
 
# person = Person.new
# person.token = "2b1f325"
# p person.valid? == false                # => true
# person.name = 'vishnu'
# person.email = 'me'
# p person.valid? == false                # => true
# person.email = 'me@vishnuatrai.com'
# p person.valid? == true                 # => true
# person.token = nil
# person.valid?

# begin
#   p person.valid?                       # => raises ActiveModel::StrictValidationFailed
# rescue StandardError => e
#   p e.inspect == "#<ActiveModel::StrictValidationFailed: Token can't be blank>"   # => true
# end
