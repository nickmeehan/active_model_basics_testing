require 'test_helper'

class TestCallbacks < MiniTest::Test

  def setup
    @person = Person.new(Callbacks)
  end

  # QUERYING OBJECT DIRECTLY FOR ITS LIST OF ALL CHANGED ATTRIBUTES

  def test_that_print_statements_are_executed
    # @person.update
    assert_equal 'I ran in update under run_callbacks(:update)', @person.update
  end

  # def assign_first_name_to_person
  #   @person.first_name = "First Name"
  # end

  # def test_that_person_first_name_is_new_value_assigned
  #   assign_first_name_to_person
  #   assert_equal "First Name", @person.first_name
  # end

end