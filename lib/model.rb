require 'minitest/autorun'
require 'bundler'
Bundler.require

class EmailContact
  include ActiveModel::Model
 
  attr_accessor :name, :email, :message
  validates :name, :email, :message, presence: true
 
  def deliver
    if valid?
      # deliver email
    end
  end
end

class TestEmailContact < MiniTest::Test

  def setup
    @email_contact = EmailContact.new(name: "David", email: "david@example.com", message: "Hello World")
  end

  def test_that_name_attribute_returns_correct_value
    assert_equal "David", @email_contact.name
  end

  def test_that_email_attribute_returns_correct_value
    assert_equal "david@example.com", @email_contact.email
  end

  def test_that_valid_returns_true_when_all_attributes_are_present
    assert_equal true, @email_contact.valid?
  end

  def test_that_persisted_is_false_when_instance_is_now_saved
    assert_equal false, @email_contact.persisted?
  end

end

# email_contact = EmailContact.new(name: 'David',
#                                  email: 'david@example.com',
#                                  message: 'Hello World')
# p email_contact.name == "David"                 # => 'David'
# p email_contact.email == "david@example.com"    # => 'david@example.com'
# p email_contact.valid? == true                  # => true
# p email_contact.persisted? == false             # => false