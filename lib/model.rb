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


# email_contact = EmailContact.new(name: 'David',
#                                  email: 'david@example.com',
#                                  message: 'Hello World')
# p email_contact.name == "David"                 # => 'David'
# p email_contact.email == "david@example.com"    # => 'david@example.com'
# p email_contact.valid? == true                  # => true
# p email_contact.persisted? == false             # => false