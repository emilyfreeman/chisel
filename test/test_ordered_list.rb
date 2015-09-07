gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ordered_list'


class OrderedListTest < Minitest::Test
  def setup
    @ordered_list = OrderedList.new
  end
  def test_empty_string_retuns_empty_string
    input = ""
    expected = ""
    output = @ordered_list.parse(input)
    assert_equal expected, output
  end
  def test_single_list_item
    input = "1. item one"
    output = @ordered_list.parse(input)
    assert_equal "<ol><li>item one</li></ol>", output
  end
  def test_double_list_item
    input = "1. item one\n2. item two"
    output = @ordered_list.parse(input)
    assert_equal "<ol><li>item one</li><li>item two</li></ol>", output
  end
  def test_triple_list_item
    input = "1. item one\n2. item two\n3. item three"
    output = @ordered_list.parse(input)
    assert_equal "<ol><li>item one</li><li>item two</li><li>item three</li></ol>", output
  end
  def test_triple_list_item_missing_num
    input = "1. item one\n2. item two\n. item three"
    output = @ordered_list.parse(input)
    assert_equal "<ol><li>item one</li><li>item two. item three</li></ol>", output
  end
end
