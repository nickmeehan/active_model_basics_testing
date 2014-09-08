require 'test_helper'
require 'person_ext/callbacks'

class TestCallbacks < MiniTest::Test

  def setup
    @person = Person.new(PersonExt::Callbacks)
  end

  def test_that_print_statements_are_executed
    assert_equal 'I ran in update under run_callbacks(:update)', @person.update
  end

end