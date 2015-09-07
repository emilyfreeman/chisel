require './lib/inline'
require './lib/block'

class UnorderedList

  attr_accessor :list_split_substring

  def parse(substring)
    create_array_from_list(substring)
    determine_format_type(@list_split_substring)
  end

  def create_array_from_list(substring)
    remove_new_line_breaks = substring.delete "\n"
    @list_split_substring = remove_new_line_breaks.split("* ").reject { |e| e.empty? }
  end

  def determine_format_type(list_split_substring)
    if list_split_substring.length == 1
      format_bold_single_item_array(list_split_substring)
    else
      format_bold_multi_item_array(list_split_substring)
    end
  end

  def format_bold_single_item_array(list_split_substring)
    parsed_list = list_split_substring.map do |e|
      e = "\n<ul>\n<li>#{e}</li>\n</ul>\n"
    end
    parsed_substring = parsed_list.join
  end

  def format_bold_multi_item_array(list_split_substring)
    parsed_list = list_split_substring.map.with_index do |e, index|
      if index == 0
        e = "\n<ul>\n<li>#{e}</li>\n"
      elsif index == list_split_substring.length - 1
        e = "\n<li>#{e}</li>\n</ul>\n"
      else
        e = "<li>#{e}</li>"
      end
    end
    parsed_substring = parsed_list.join
  end

end
