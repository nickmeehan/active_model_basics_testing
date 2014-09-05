require 'test_helper'
require File.expand_path('../../../lib/naming', __FILE__)

class TestNaming < MiniTest::Test

  def setup
    Person.send(:include, Naming)
  end

  def test_that_name_of_model_name_is_in_fact_itself
    assert_equal "Person", Person.model_name.name
  end

  def test_that_singular_version_of_model_name_returns_correct_value
    assert_equal "person", Person.model_name.singular
  end

  def test_that_plural_version_of_model_name_returns_correct_value
    assert_equal "people", Person.model_name.plural
  end

  def test_that_element_of_model_name_returns_correct_value
    assert_equal "person", Person.model_name.element
  end

  def test_that_human_of_model_name_returns_correct_value
    assert_equal "Person", Person.model_name.human
  end

  def test_that_collection_of_model_name_returns_correct_value
    assert_equal "people", Person.model_name.collection
  end

  def test_that_param_key_of_model_name_returns_correct_value
    assert_equal "person", Person.model_name.param_key
  end

  def test_that_i18n_key_of_model_name_returns_correct_value
    assert_equal :person, Person.model_name.i18n_key
  end

  def test_that_route_key_of_model_name_returns_correct_value
    assert_equal "people", Person.model_name.route_key
  end

  def test_that_singular_route_key_of_model_name_returns_correct_value
    assert_equal "person", Person.model_name.singular_route_key
  end

end