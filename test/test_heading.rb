gem 'minitest'              # => true
require 'minitest/autorun'  # => true
require 'minitest/pride'    # => true
require './lib/heading'

class HeadingTest < Minitest::Test
  def setup
    @heading = Heading.new
  end

  def test_single_hash_parses_to_h1
    string = "#I am a first-level heading"
    output = @chisel.parse_heading(string)
    assert_equal "<h1>I am a first-level heading</h1>", output
  end

  def test_double_hash_parses_to_h2
    string = "##I am a second-level heading"
    output = @chisel.parse_heading(string)
    assert_equal "<h2>I am a second-level heading</h2>", output
  end

  def test_quad_hash_parses_to_h4
    string = "####I am a fourth-level heading"
    output = @chisel.parse_heading(string)
    assert_equal "<h4>I am a fourth-level heading</h4>", output
  end

  def test_hexa_hash_parses_to_h6
    string = "######I am a sixth-level heading"
    output = @chisel.parse_heading(string)
    assert_equal "<h6>I am a sixth-level heading</h6>", output
  end

  def test_space_between_hash_and_heading
    string = "# I am a first-level heading"
    output = @chisel.parse_heading(string)
    assert_equal "<h1>I am a first-level heading</h1>", output
  end

  def test_remove_space_between_hash_and_heading
    string = "# I am a first-level heading"
    output = @chisel.parse_heading(string)
    assert_equal "<h1>I am a first-level heading</h1>", output
  end

  def test_headings_that_contain_hashes
    string = "# I am a first-level heading ##"
    output = @chisel.parse_heading(string)
    assert_equal "<h1>I am a first-level heading ##</h1>", output
  end

  def test_headings_that_contain_hashes_in_middle
    string = "# I am a first-level heading ## with extra hashes"
    output = @chisel.parse_heading(string)
    assert_equal "<h1>I am a first-level heading ## with extra hashes</h1>", output
  end

end
