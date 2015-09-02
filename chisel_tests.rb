gem 'minitest'              # => true
require 'minitest/autorun'  # => true
require 'minitest/pride'    # => true
require './chisel'

# A chunk of text starting with #, ##, ###, ####, or ##### is turned into an HTML header (<h1>, <h2>) with the header level corresponding to the number of # symbols
# A chunk of text not starting with # is turned into a paragraph

class ChiselTest < Minitest::Test

  def test_include_octothorpe
    string = "#"                   # => "#"
    correct = string.include? "#"  # => true
    assert_equal true, correct     # => true
  end

  def test_is_heading_one?
    heading = "#I am a heading"           # => "#I am a heading"
    is_heading = heading.start_with? "#"  # => true
    assert_equal true, is_heading         # => true
  end

  def test_not_a_heading
    heading = "I am a heading"            # => "I am a heading"
    is_heading = heading.start_with? "#"  # => false
    assert_equal false, is_heading        # => true
  end

  def test_hash_but_not_heading
    sentence = "I am not a #1 heading"     # => "I am not a #1 heading"
    is_heading = sentence.start_with? "#"  # => false
    assert_equal false, is_heading         # => true
  end

  def test_double_heading?
    heading = "## I am a second-level heading"  # => "## I am a second-level heading"
    is_heading = heading.start_with? "#"        # => true
    assert_equal true, is_heading               # => true
  end

  def test_no_hash
    string = "I am a second-level heading".split  # => ["I", "am", "a", "second-level", "heading"]
    is_heading = string.none? {|e| e == "#"}      # => true
    assert_equal true, is_heading                 # => true
  end

  def test_one_heading_logic
    string = "# I am a heading"                                           # => "# I am a heading"
    one_heading = string.each_char.take_while {|e| e == "#"}.length == 1  # => true
    assert_equal true, one_heading                                        # => true
  end

  def test_one_heading_output
    string = "# I am a heading"                                         # => "# I am a heading"
    new_string = string.each_char.drop_while {|e| e == "#"}.join.strip  # => "I am a heading"
    "<h1>#{new_string}</h1>"                                            # => "<h1>I am a heading</h1>"
    assert_equal "I am a heading", new_string                           # => true
  end

  def test_level_two_heading
    string = "## I am a second-level heading"                             # => "## I am a second-level heading"
    one_heading = string.each_char.take_while {|e| e == "#"}.length == 2  # => true
    assert_equal true, one_heading                                        # => true
  end

  def test_distinguish_one_from_two_heading
    string = "## I am a second-level heading"                             # => "## I am a second-level heading"
    if string.each_char.take_while {|e| e == "#"}.length == 1             # => false
      new_string = string.each_char.drop_while {|e| e == "#"}.join.strip
      "<h1>#{new_string}</h1>"
    elsif string.each_char.take_while {|e| e == "#"}.length == 2          # => true
      new_string = string.each_char.drop_while {|e| e == "#"}.join.strip  # => "I am a second-level heading"
      "<h2>#{new_string}</h2>"                                            # => "<h2>I am a second-level heading</h2>"
    end                                                                   # => "<h2>I am a second-level heading</h2>"
    assert_equal "I am a second-level heading", new_string                # => true
  end

  def test_heading_level
    string = "## I am a second-level heading"                   # => "## I am a second-level heading"
    length = string.each_char.take_while {|e| e == "#"}.length  # => 2
    included = (1..6).include? length                           # => true
    assert_equal true, included                                 # => true
  end

  def test_heading_level_again
    string = "## I am a second-level heading"                     # => "## I am a second-level heading"
    is_heading = string.start_with? "#"                           # => true
    if true                                                       # => true
      length = string.each_char.take_while {|e| e == "#"}.length  # => 2
    end                                                           # => 2
    assert_equal 2, length                                        # => true
  end

  def test_heading_parser_interpolation
    string = "## I am a second-level heading"                       # => "## I am a second-level heading"
    is_heading = string.start_with? "#"                             # => true
    if true                                                         # => true
      length = string.each_char.take_while {|e| e == "#"}.length    # => 2
      output = "<h#{length}>#{string}</h#{length}>"                 # => "<h2>## I am a second-level heading</h2>"
    end                                                             # => "<h2>## I am a second-level heading</h2>"
    assert_equal "<h2>## I am a second-level heading</h2>", output  # => true
  end

  def test_two_hashes_parses_to_h2
    chisel = Chisel.new()
    string = "## I am a second-level heading"
    output = chisel.parse(string)                   # => "## I am a second-level heading"
    assert_equal "<h2>I am a second-level heading</h2>", output
  end

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

  def test_paragraph
    chisel = Chisel.new
    paragraph = "This is the first line of the paragraph.\nThis is the second line of the same paragraph."
    output = chisel.parse(paragraph)
    assert_equal "<p>This is the first line of the paragraph.\nThis is the second line of the same paragraph.</p>", output
  end

  def test_two_paragraphs
    chisel = Chisel.new
    paragraph = "First paragraph.\n\nThis is another paragraph."
    output = chisel.parse(paragraph)
    assert_equal "<p>First paragraph.</p><p>This is another paragraph.</p>", output
  end





#FOCUS ON headings

# string = "###Triple Heading"
# heading = string.each_char.take_while {|e| e == "#"}.length



=begin
# NOTES:

* Look @ String.each_char
* Look at Enumerable.take_while

=end

#     people = [
#   { :house => 'Lannister', :name => 'Jaime "Kingslayer" Lannister' },
#   { :house => 'Lannister', :name => 'Cersei Lannister' },
#   { :house => 'Stark', :name => 'Jon Snow' },
#   { :house => 'Stark', :name => 'Maester Luwin' },
#   { :house => 'Stark', :name => 'Ned Start' }
# ]
#
# lannisters, starks = people.partition { |person| person[:house] == 'Lannister' }

end

# string.chars
# character_combinations:
# headings #..######






# def test_find_first_seven_letter_word
#   words = ["capricious", "berry", "unicorn", "bag", "apple", "festering", "pretzel", "pencil"]
#   found = nil
#   words.each do |word|
#     if word.length == 7
#       found = word
#       break
#     end
#   end
#   assert_equal "unicorn", found
# end

# >> Run options: --seed 40289
# >>
# >> # Running:
# >>
# >> .............
# >>
# >> Finished in 0.004584s, 2835.9128 runs/s, 2835.9128 assertions/s.
# >>
# >> 13 runs, 13 assertions, 0 failures, 0 errors, 0 skips
