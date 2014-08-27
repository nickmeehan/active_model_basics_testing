require 'minitest/autorun'
require 'bundler'
Bundler.require

require 'active_model'
 
class Person
  include ActiveModel::Dirty
  define_attribute_methods :first_name, :last_name
 
  def first_name
    @first_name
  end
 
  def first_name=(value)
    first_name_will_change!
    @first_name = value
  end
 
  def last_name
    @last_name
  end
 
  def last_name=(value)
    last_name_will_change!
    @last_name = value
  end
 
  def save
    # do save work...
    changes_applied
  end
end


class TestPerson < Minitest::Test

  def setup
    @person = Person.new
  end

  # QUERYING OBJECT DIRECTLY FOR ITS LIST OF ALL CHANGED ATTRIBUTES

  def test_that_person_model_has_not_changed
    assert_equal false, @person.changed?
  end

  def assign_first_name_to_person
    @person.first_name = "First Name"
  end

  def test_that_person_first_name_is_new_value_assigned
    assign_first_name_to_person
    assert_equal "First Name", @person.first_name
  end

  def test_that_person_model_has_changed
    assign_first_name_to_person
    assert_equal true, @person.changed?
  end

  def test_that_person_changed_returns_list_of_attributes_changed
    assign_first_name_to_person
    assert_equal ["first_name"], @person.changed
  end

  def test_that_person_changed_attributes_returns_a_hash_of_attributes_changed_with_original_values
    assign_first_name_to_person
    assert_equal({"first_name"=>nil}, @person.changed_attributes)
  end

  def test_that_person_changes_returns_a_hash_of_changes_with_attribute_names_as_keys_and_values_are_an_array_of_old_and_new_values_for_the_field
    assign_first_name_to_person
    assert_equal({"first_name"=>[nil, "First Name"]}, @person.changes)
  end

  # ATTRIBUTE BASED ACCESSOR METHODS

  def test_that_attr_name_changed_returns_correct_value
    assign_first_name_to_person
    assert_equal true, @person.first_name_changed?
  end

  def test_that_attr_name_was_accessor_returns_correct_value
    assign_first_name_to_person
    assert_equal "First Name", @person.first_name_was
  end

  def test_that_attr_name_change_returns_correct_values
    assign_first_name_to_person
    assert_equal [nil, "First Name"], @person.first_name_change
    assert_equal nil, @person.last_name_change
  end

end


# # QUERYING OBJECT DIRECTLY FOR ITS LIST OF ALL CHANGED ATTRIBUTES

# person = Person.new
# p person.changed? == false # => true
 
# person.first_name = "First Name"
# p person.first_name == "First Name" # => true
 
# # returns if any attribute has changed.
# p person.changed? == true # => true
 
# # returns a list of attributes that have changed before saving.
# p person.changed == ["first_name"] # => true
 
# # returns a hash of the attributes that have changed with their original values.
# p person.changed_attributes == {"first_name"=>nil} # => true
 
# # returns a hash of changes, with the attribute names as the keys, and the values will be an array of the old and new value for that field.
# p person.changes == {"first_name"=>[nil, "First Name"]} # => true


# # ATTRIBUTE BASED ACCESSOR METHODS

# # attr_name_changed?
# p person.first_name == "First Name" # => true
# p person.first_name_changed? == true # => true

# # attr_name_was accessor
# p person.first_name_was == "First Name" # => true

# # attr_name_change
# p person.first_name_change == [nil, "First Name"] # => true
# p person.last_name_change == nil # => true