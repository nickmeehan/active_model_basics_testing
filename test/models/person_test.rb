require 'test_helper'
 
class PersonTest < ActiveSupport::TestCase
  include ActiveModel::Lint::Tests
 
  def setup
    @model = Person.new(ActiveModel::Model)
  end
end