gem 'minitest'              # => true
require 'minitest/autorun'  # => true
require 'minitest/pride'    # => true
require './bold'

  def test_no_double_asterisk
    string = ""
    output = @chisel.parse_bold(string)
    assert_equal "", output
  end

  def test_double_asterisk_bold
    string = "**bold**"
    output = @chisel.parse_bold(string)
    assert_equal "<strong>bold</strong>", output
  end

  def test_full_sentence_bold
    string = "I am a **bolded** sentence."
    output = @chisel.parse_bold(string)
    assert_equal "I am a <strong>bolded</strong> sentence.", output
  end

  def test_full_sentence_start_with_bold
    string = "**Bolded** sentence."
    output = @chisel.parse_bold(string)
    assert_equal "<strong>Bolded</strong> sentence.", output
  end

  def test_full_sentence_end_with_bold
    string = "Full sentence with **bold**."
    output = @chisel.parse_bold(string)
    assert_equal "Full sentence with <strong>bold</strong>.", output
  end

  def test_two_bolds_one_sentence
    string = "Full sentence with **bold** and **bold**."
    output = @chisel.parse_bold(string)
    assert_equal "Full sentence with <strong>bold</strong> and <strong>bold</strong>.", output
  end

  def test_bold_with_paragraph_break
    string = "Full sentence with **bold**\n\n and **bold**."
    output = @chisel.parse_bold(string)
    assert_equal "Full sentence with <strong>bold</strong>\n\n and <strong>bold</strong>.", output
  end

  def test_double_asterisk_with_space
    string = "Full sentence with ** bold**."
    output = @chisel.parse_bold(string)
    assert_equal "Full sentence with ** bold**.", output
  end

  def test_double_asterisk_with_space
    string = "Full sentence with ** bold**."
    output = @chisel.parse_bold(string)
    assert_equal "Full sentence with ** bold**.", output
  end

  def test_double_asterisk_with_space_and_line_break
    string = "Full sentence with ** bold**\n\n."
    output = @chisel.parse_bold(string)
    assert_equal "Full sentence with ** bold**\n\n.", output
  end

  def test_double_asterisk_spaces_no_bold
    string = "Full sentence with ** bold **."
    output = @chisel.parse_bold(string)
    assert_equal "Full sentence with ** bold **.", output
  end
