require 'test_helper'
require File.expand_path('../../../lib/callbacks', __FILE__)

class TestCallbacks < MiniTest::Test

  def setup
    @person = Person.new(Callbacks)
  end

  def test_that_print_statements_are_executed
    assert_equal 'I ran in update under run_callbacks(:update)', @person.update
  end

end