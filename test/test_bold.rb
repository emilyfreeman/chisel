gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/bold'


class BoldTest < Minitest::Test
  def setup
    @bold = Bold.new
  end
  def test_simple_bold
    input = "**yay**"
    expected = "<strong>yay</strong>"
    output = @bold.parse(input)
    assert_equal expected, output
  end
  def test_double_bold
    input = "**yay** **boo**"
    expected = "<strong>yay</strong> <strong>boo</strong>"
    output = @bold.parse(input)
    assert_equal expected, output
  end
  def test_no_bold
    input = "yay boo"
    expected = "yay boo"
    output = @bold.parse(input)
    assert_equal expected, output
  end
  def test_double_splat_first_char
    input = "**yay boo"
    expected = "**yay boo"
    output = @bold.parse(input)
    assert_equal expected, output
  end
  def test_double_splat_middle
    input = "yay **boo"
    expected = "yay **boo"
    output = @bold.parse(input)
    assert_equal expected, output
  end
  def test_double_splat
    input = "yay**boo"
    expected = "yay**boo"
    output = @bold.parse(input)
    assert_equal expected, output
  end
  def test_double_splat_last_char
    input = "yay boo**"
    expected = "yay boo**"
    output = @bold.parse(input)
    assert_equal expected, output
  end
  def test_multiple_words_bolded
    input = "This sentence has **bolded words** and more **bold**!"
    expected = "This sentence has <strong>bolded words</strong> and more <strong>bold</strong>!"
    output = @bold.parse(input)
    assert_equal expected, output
  end
  def test_sentence_with_break
    input = "This sentence has **bolded words** \n\nand more **bold**!"
    expected = "This sentence has <strong>bolded words</strong> \n\nand more <strong>bold</strong>!"
    output = @bold.parse(input)
    assert_equal expected, output
  end

end
