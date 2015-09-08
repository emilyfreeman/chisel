gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/block'


class BlockTest < Minitest::Test
  def setup
    @block = Block.new
  end
  def test_empty_string_retuns_empty_string
    input = ""
    expected = []
    output = @block.parse(input)
    assert_equal expected, output
  end
  def test_heading
    input = "##I am a heading."
    output = @block.parse(input)
    assert_equal "\n<h2>I am a heading.</h2>\n", output.join
  end
  def test_four_hash_heading
    input = "####I am a heading."
    output = @block.parse(input)
    assert_equal "\n<h4>I am a heading.</h4>\n", output.join
  end
  def test_unordered_list
    input = "Unordered list:\n\n* Item 1\n* Item 2"
    output = @block.parse(input)
    assert_equal "\n<p>\nUnordered list:\n</p>\n\n<ul>\n<li>Item 1</li>\n\n<li>Item 2</li>\n</ul>\n", output.join
  end
  def test_bold_string_in_paragraph
    input = "This is a test of the **emergency** broadcast system."
    output = @block.parse(input)
    assert_equal "\n<p>\nThis is a test of the <strong>emergency</strong> broadcast system.\n</p>\n", output.join
  end
  def test_paragraph
    input = "I am a paragraph."
    output = @block.parse(input)
    assert_equal "\n<p>\nI am a paragraph.\n</p>\n", output.join
  end
end
