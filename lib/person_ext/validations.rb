require 'active_support/concern'

module PersonExt
  module Validations
    extend ActiveSupport::Concern
    include ActiveModel::Validations

    attr_accessor :name, :email, :token

    included do
      validates :name, presence: true
      validates_format_of :email, with: /\A([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})\z/i
      validates! :token, presence: true
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
