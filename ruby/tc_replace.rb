require_relative "test_helper"

require "test/unit"
require_relative "replace"

class TestReplace < Test::Unit::TestCase

  def test_string_with_not_enough_space_should_raise_not_enough_spaces_error
    string = nil
    assert_raise( NotEnoughSpacesError ) { Replace.spaces_in_string string }
    string = ""
    assert_raise( NotEnoughSpacesError ) { Replace.spaces_in_string string }
    string = " "
    assert_raise( NotEnoughSpacesError ) { Replace.spaces_in_string string }
    string = "  "
    assert_raise( NotEnoughSpacesError ) { Replace.spaces_in_string string }
    string = "ab  "
    assert_raise( NotEnoughSpacesError ) { Replace.spaces_in_string string }
    string = "string with spaces"
    assert_raise( NotEnoughSpacesError ) { Replace.spaces_in_string string }
    string = "string with spaces   "
    assert_raise( NotEnoughSpacesError ) { Replace.spaces_in_string string }
    string = "a b  "
    assert_nothing_raised { Replace.spaces_in_string string }
  end
  
  def test_empty_string_with_enough_space_should_return_empty_string_with_length_0
    empty_string = "   "
    expected = ""
    actual = Replace.spaces_in_string empty_string
    assert_equal expected, actual
  end
  
  def test_get_number_of_words_in_string_should_be_0_if_string_is_empty
    empty_string = "   "
    expected = 0
    actual = Replace.get_number_of_spaces_in empty_string
    assert_equal expected, actual
  end
  
  def test_get_number_of_spaces_in_string
    string = "a   "
    expected = 1
    actual = Replace.get_number_of_spaces_in string
    assert_equal expected, actual
    string = "string with spaces"
    expected = 2
    actual = Replace.get_number_of_spaces_in string
    assert_equal expected, actual
  end
  
  def test_string_with_only_spaces_at_the_end_should_return_the_content_without_replacing_the_spaces
   string = "a   "
   expected = "a"
   actual = Replace.spaces_in_string string
   assert_equal expected, actual
   string = "string           "
   expected = "string"
   actual = Replace.spaces_in_string string
   assert_equal expected, actual
  end
  
  def test_string_with_spaces_only_on_both_sides
    string = "  string  "
    expected = "string"
    actual = Replace.spaces_in_string string
    assert_equal expected, actual
  end
  
  def test_string_with_spaces_in_the_middle_should_be_replaced_if_there_are_enough_space
    string = "string with spaces    "
    expected = "string%20with%20spaces"
    actual = Replace.spaces_in_string string
    assert_equal expected, actual
    string = "string   with   spaces"
    actual = Replace.spaces_in_string string
    assert_equal expected, actual
  end
  
end