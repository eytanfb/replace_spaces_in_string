require "test/unit"

require "replace"

class TestReplace < Test::Unit::TestCase
  def test_empty_string
    empty_string = " "
    expected = ""
    actual = Replace.spaces_in_string empty_string
    
  end
end