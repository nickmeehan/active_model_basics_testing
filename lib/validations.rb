require 'bundler'
Bundler.require

class Person
  include ActiveModel::Validations

  attr_accessor :name, :email, :token
 
  validates :name, presence: true
  validates_format_of :email, with: /\A([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})\z/i
  validates! :token, presence: true
end
 
person = Person.new
person.token = "2b1f325"
p person.valid? == false                # => true
person.name = 'vishnu'
person.email = 'me'
p person.valid? == false                # => true
person.email = 'me@vishnuatrai.com'
p person.valid? == true                 # => true
person.token = nil
p person.valid?                         # => raises ActiveModel::StrictValidationFailed