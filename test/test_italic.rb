gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/italic'


class ItalicTest < Minitest::Test
  def setup
    @italic = Italic.new
  end
  def test_empty_string_retuns_empty_string
    input = ""
    expected = ""
    output = @italic.parse(input)
    assert_equal expected, output
  end
  def test_simple_italicizing
    input = "*yay*"
    expected = "<em>yay</em>"
    output = @italic.parse(input)
    assert_equal expected, output
  end
  def test_double_italicizing
    input = "*yay* *boo*"
    expected = "<em>yay</em> <em>boo</em>"
    output = @italic.parse(input)
    assert_equal expected, output
  end
  def test_no_italics
    input = "yay boo"
    expected = "yay boo"
    output = @italic.parse(input)
    assert_equal expected, output
  end
  def test_single_splat_first_char
    input = "*yay boo"
    expected = "*yay boo"
    output = @italic.parse(input)
    assert_equal expected, output
  end
  def test_single_splat_middle
    input = "yay *boo"
    expected = "yay *boo"
    output = @italic.parse(input)
    assert_equal expected, output
  end
  def test_double_splat
    input = "yay**boo"
    expected = "yay<em></em>boo"
    output = @italic.parse(input)
    assert_equal expected, output
  end
  def test_single_splat_last_char
    input = "yay boo*"
    expected = "yay boo*"
    output = @italic.parse(input)
    assert_equal expected, output
  end

end
