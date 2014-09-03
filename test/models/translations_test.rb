require 'test_helper'

class TestTranslations < MiniTest::Test

  def setup
    Person.send(:include, Translations)
  end

  def test_that_human_attribute_name_is_correct
    assert_equal "Nome", Person.human_attribute_name('name')
  end

end