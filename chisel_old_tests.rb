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
