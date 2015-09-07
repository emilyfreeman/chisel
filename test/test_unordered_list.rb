gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/unordered_list'


class UnorderedListTest < Minitest::Test
  def setup
    @unordered_list = UnorderedList.new
  end
  def test_empty_string_retuns_empty_string
    input = ""
    expected = ""
    output = @unordered_list.parse(input)
    assert_equal expected, output
  end
  def test_empty_list
    input = "* "
    output = @unordered_list.parse(input)
    assert_equal "", output
  end
  def test_sentence
    input = "* I am a single list item"
    output = @unordered_list.parse(input)
    assert_equal "<ul><li>I am a single list item</li></ul>", output
  end
  def test_two_bullet_list
    input = "* Bullet 1\n* Bullet 2"
    output = @unordered_list.parse(input)
    assert_equal "<ul><li>Bullet 1</li><li>Bullet 2</li></ul>", output
  end
  def test_three_bullet_list
    input = "* Bullet 1\n* Bullet 2\n* Bullet 3"
    output = @unordered_list.parse(input)
    assert_equal "<ul><li>Bullet 1</li><li>Bullet 2</li><li>Bullet 3</li></ul>", output
  end
  def test_five_bullet_list
    input = "* Bullet 1\n* Bullet 2\n* Bullet 3\n* Bullet 4\n* Bullet 5"
    output = @unordered_list.parse(input)
    assert_equal "<ul><li>Bullet 1</li><li>Bullet 2</li><li>Bullet 3</li><li>Bullet 4</li><li>Bullet 5</li></ul>", output
  end
  def test_bullet_list_splat_without_space
    input = "* Bullet 1\n* Bullet 2\n*Bullet 3"
    output = @unordered_list.parse(input)
    assert_equal "<ul><li>Bullet 1</li><li>Bullet 2*Bullet 3</li></ul>", output
  end
end
