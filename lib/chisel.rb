require 'pry'  # => true

class Chisel

  attr_accessor :split_string,
                :arr,
                :heading_num,
                :unparsed_array,
                :parsed_heading

  BLOCK_TOKEN = "\n\n"

  def initialize()
  end

  def parse(string)
    @split_string = parse_blocks(string)
    # parse_paragraph(@split_string)
  end

  def parse_blocks(string)
    string.split(BLOCK_TOKEN).reject { |e| e.empty? }
  end

  def parse_heading(unparsed_string)
    if unparsed_string.start_with? "#"
      create_array_from_heading(unparsed_string)
      heading_hash_count(@arr)
    end

  end

  def create_array_from_heading(unparsed_string)
    @arr = unparsed_string.chars
  end

  def heading_hash_count(unparsed_array)
    hash_num = 0
    unparsed_array.map! do |e|
      break if e != "#"
      hash_num += 1
      e.delete! e
    end
    @heading_num = hash_num
    parsed_string = unparsed_array.join
      if parsed_string.start_with? " "
        parsed_string.strip!
      end
    "<h#{@heading_num}>#{parsed_string}</h#{@heading_num}>"
  end

  def parse_bold(unparsed_string)
    arr = unparsed_string.split("**")
    unparsed_string = arr.map.with_index do |e, index|
      if index.odd?
        if e.start_with? " "
          e = "**#{e}**"
        else
          e = "<strong>#{e}</strong>"
        end
      else
        e
      end
    end
    unparsed_string.join
  end

  def parse_unordered_lists(unparsed_string)
    if unparsed_string.include? "\n* "
      unordered_array = unparsed_string.split "\n* "
    end
    array = unordered_array.map.with_index do |e, index|
      if e[index] != e[-1]
        e = "<ul>\n<li>#{e}</li>"
      else
        e = "<ul>\n<li>#{e}</li>\n</ul>"
      end
    end
  end

end
