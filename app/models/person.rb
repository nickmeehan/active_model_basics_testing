require 'bundler'
Bundler.require

class Person
  include ActiveModel::Model
  extend ActiveModel::Translation
end


# p Person.human_attribute_name('name') # => "Nome"