require 'test_helper'
 
class TestPerson < ActiveSupport::TestCase
  include ActiveModel::Lint::Tests
 
  def setup
    @model = Person.new(ActiveModel::Model)
  end
end