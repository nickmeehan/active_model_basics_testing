require 'test_helper'

class TestSerializersXml < MiniTest::Test

  def setup
    @person = Person.new(SerializersXml)
    @xml = { name: "Bob" }.to_xml
  end

  def test_that_to_xml_hash_returns_correct_value_after_initialization
    assert_equal("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<person>\n  <name nil=\"true\"/>\n</person>\n", @person.to_xml)
  end

  def test_that_to_xml_hash_returns_correct_value_after_attribute_value_changes
    @person.name = "Bob"
    assert_equal("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<person>\n  <name>Bob</name>\n</person>\n", @person.to_xml)
  end

  def test_that_from_xml_assigns_correct_attributes_to_instance
    assert_equal @person, @person.from_xml(@xml)
    assert_equal "Bob", @person.name
  end

end