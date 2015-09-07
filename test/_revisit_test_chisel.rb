gem 'minitest'              # => true
require 'minitest/autorun'  # => true
require 'minitest/pride'    # => true
require './lib/chisel'

# A chunk of text starting with #, ##, ###, ####, or ##### is turned into an HTML header (<h1>, <h2>) with the header level corresponding to the number of # symbols
# A chunk of text not starting with # is turned into a paragraph

class ChiselTest < Minitest::Test

  def setup
    @chisel = Chisel.new
  end

  def test_spliting_input_into_blocks
    input = "# Bo Jangles\n\nThe cat - of dreams."
    output = @chisel.parse_blocks(input)
    assert_equal 2, output.length
  end

  def test_spliting_input_into_three_blocks
    input = "# Bo Jangles\n\nThe cat - of dreams.\n\nyay denver"
    output = @chisel.parse_blocks(input)
    assert_equal 3, output.length
  end

  def test_no_split_single_break
    input = "# Bo Jangles\nThe cat - of dreams.\nyay denver"
    output = @chisel.parse_blocks(input)
    assert_equal 1, output.length
  end

  def test_triple_line_break
    input = "# Bo Jangles\n\n\nThe cat - of dreams.\n\n\nyay denver"
    output = @chisel.parse_blocks(input)
    assert_equal 3, output.length
  end

  def test_quad_line_break
    input = "# Bo Jangles\n\n\n\nThe cat - of dreams.\n\n\n\nyay denver"
    output = @chisel.parse_blocks(input)
    assert_equal 3, output.length
  end

  def test_absurd_amount_of_line_breaks
    input = "# Bo Jangles\n\n\n\n\n\n\n\n\n\n\n\nThe cat - of dreams.\n\n\n\n\n\n\n\nyay denver"
    output = @chisel.parse_blocks(input)
    assert_equal 3, output.length
  end




  def test_emphasis
    string = "Full sentence with ** bold **."
    output = @chisel.parse_bold(string)
    assert_equal "Full sentence with ** bold **.", output
  end

  def test_unordered_list
    string = "* Unordered list item 1 * Unordered list item 2"
    output = @chisel.parse_unordered_lists(string)
    refute output
  end

  def test_unordered_list_break
    string = "\n\n* Unordered list item 1 \n* Unordered list item 2"
    output = @chisel.parse_bold(string)
    assert_equal "<ul>\n<li>Unordered list item 1</li>\n<li>Unordered list item 2</li>\n</ul>", output
  end


  # def test_no_line_breaks
  #   paragraph = "Word"
  #   output = @chisel.parse_paragraph(paragraph)
  #   assert_equal "<p>Word</p>", output
  # end
  #
  # def test_single_paragraph
  #   paragraph = "This is the first line of the paragraph.\nThis is the second line of the same paragraph."
  #   output = @chisel.parse_paragraph(paragraph)
  #   assert_equal "<p>This is the first line of the paragraph.\nThis is the second line of the same paragraph.</p>", output
  # end
  #
  # def
  #
  # def test_two_paragraphs
  #   chisel = Chisel.new
  #   paragraph = "First paragraph.\n\nThis is another paragraph."
  #   output = chisel.parse_paragraph(paragraph)
  #   assert_equal "<p>First paragraph.</p><p>This is another paragraph.</p>", output
  # end


=begin


  def test_two_hashes_parses_to_h2_no_space
    chisel = Chisel.new()
    string = "##I am a second-level heading"
    output = chisel.parse(string)                   # => "## I am a second-level heading"
    assert_equal "<h2>I am a second-level heading</h2>", output
  end

  def test_two_hashes_parses_to_h2_extra_hash
    skip
    chisel = Chisel.new()
    string = "##I have another # in my title"
    output = chisel.parse(string)                   # => "## I am a second-level heading"
    assert_equal "<h2>I have another # in my title</h2>", output
  end

  def test_two_hashes_parses_to_h1
    chisel = Chisel.new()
    string = "# I am a first-level heading"
    output = chisel.parse(string)                   # => "## I am a second-level heading"
    assert_equal "<h1>I am a first-level heading</h1>", output
  end

  def test_two_hashes_parses_to_h1_no_space
    chisel = Chisel.new()
    string = "#I am a first-level heading"
    output = chisel.parse(string)                   # => "## I am a second-level heading"
    assert_equal "<h1>I am a first-level heading</h1>", output
  end

  def test_six_hashes
    chisel = Chisel.new()
    string = "###### I am a first-level heading"
    output = chisel.parse(string)                   # => "## I am a second-level heading"
    assert_equal "<h6>I am a first-level heading</h6>", output
  end


  def test_bold_with_end_tag
    chisel = Chisel.new
    string = "Sentence has **bold** in middle."
    output = chisel.parse_bold(string)
    assert_equal "Sentence has <strong>bold</strong> in middle.", output
  end

  def test_bold_in_two_places
    chisel = Chisel.new
    string = "Sentence has **bold** in **bold again** middle."
    output = chisel.parse_bold(string)
    assert_equal "Sentence has <strong>bold</strong> in <strong>bold again</strong> middle.", output
  end

  def test_space_between_asterisk_and_word
    chisel = Chisel.new
    string = "Sentence has ** bold ** in **bold again** middle."
    output = chisel.parse_bold(string)
    assert_equal "Sentence has <strong> bold </strong> in <strong>bold again</strong> middle.", output
  end

  ### edge case to fix
  # def test_two_asterisk_not_bold
  #   chisel = Chisel.new
  #   string = "Sentence has **bold in middle."
  #   output = chisel.parse_bold(string)
  #   assert_equal "Sentence has bold in bold again middle.", output
  # end

  def test_unordered_list
    chisel = Chisel.new
    string = "* Item 1"
    output = chisel.parse_list(string)
    assert_equal "<li>Item 1", output
  end

  def test_unordered_list
    chisel = Chisel.new
    string = "* Item 1"
    output = chisel.parse_list(string)
    assert_equal "<li>Item 1", output
  end

  def test_heading_with_more_text
    chisel = Chisel.new
    string = "## Heading \n\n Paragraph after heading."
    output = chisel.parse(string)
    assert_equal "<h2> Heading <p>Paragraph after heading</p>", output
  end
=end
end

#FOCUS ON headings

# string = "###Triple Heading"
# heading = string.each_char.take_while {|e| e == "#"}.length
