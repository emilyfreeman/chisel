require './lib/inline'
require './lib/heading'
require './lib/unordered_list'
require './lib/ordered_list'
require './lib/paragraph'

class Block

  def initialize()
  end

  def parse(string)
    split_string = parse_blocks(string)
    parsed_substrings = split_string.map do |substring|
      block_type(substring)
    end
  end

  def parse_blocks(string)
    string.split("\n\n")
  end

  def block_type(substring)
    if substring.include? "#"
      Heading.new.parse(substring)
    elsif substring.start_with? "* "
      UnorderedList.new.parse(substring)
    elsif substring.start_with? "1. "
      OrderedList.new.parse(substring)
    else
      Paragraph.new.parse(substring)
    end
  end

end
