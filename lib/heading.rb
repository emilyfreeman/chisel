require './lib/inline'
require './lib/block'

class Heading

  def parse(substring)
    create_array_from_heading(substring)
    heading_hash_count(@heading_split_substring)
    Inline.new.parse(@parsed_substring)
  end

  def create_array_from_heading(substring)
    @heading_split_substring = substring.chars
  end

  def heading_hash_count(heading_split_substring)
    hash_num = 0
    heading_split_substring.map! do |e|
      break if e != "#"
      hash_num += 1
      e.delete! e
    end
    heading_num = hash_num
    parsed_substring = heading_split_substring.join
      if parsed_substring.start_with? " "
        parsed_substring.strip!
      end
    @parsed_substring = "\n<h#{heading_num}>#{parsed_substring}</h#{heading_num}>\n"
  end

end
