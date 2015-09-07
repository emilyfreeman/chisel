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


end
