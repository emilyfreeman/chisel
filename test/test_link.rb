gem 'minitest'              # => true
require 'minitest/autorun'  # => true
require 'minitest/pride'    # => true
require './lib/link'

def test_empty_string
  string = ""
  output = @chisel.parse_heading(string)
  assert_equal "<h1>I am a first-level heading</h1>", output
end
