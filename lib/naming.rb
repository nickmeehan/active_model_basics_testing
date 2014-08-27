require 'minitest/autorun'
require 'bundler'
Bundler.require

class Person
  extend ActiveModel::Naming
end

class TestPerson < MiniTest::Test

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
 
# p Person.model_name.name == "Person"                # => true
# p Person.model_name.singular == "person"            # => true
# p Person.model_name.plural == "people"              # => true
# p Person.model_name.element == "person"             # => true
# p Person.model_name.human == "Person"               # => true
# p Person.model_name.collection == "people"          # => true
# p Person.model_name.param_key == "person"           # => true
# p Person.model_name.i18n_key == :person             # => true
# p Person.model_name.route_key == "people"           # => true
# p Person.model_name.singular_route_key == "person"  # => true
