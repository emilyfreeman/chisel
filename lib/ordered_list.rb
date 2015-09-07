require './lib/inline'
require './lib/block'

class OrderedList

  attr_accessor :list_split_substring

  def parse(substring)
    create_array_from_list(substring)
    determine_format_type(@list_split_substring)
  end

  def create_array_from_list(substring)
    split_substring = substring.split "\n"
    @list_split_substring = remove_item_numbers(split_substring)
  end

  def remove_item_numbers(split_substring)
    split_substring.map.with_index do |e, index|
      num = 1..9
      temp_arr = e.chars
      if num.include? temp_arr[0].to_i
        temp_arr.shift(3)
        e = temp_arr.join
      else
        e
      end
    end
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
      e = "\n<ol>\n<li>#{e}</li>\n</ol>\n"
    end
    parsed_substring = parsed_list.join
  end

  def format_bold_multi_item_array(list_split_substring)
    parsed_list = list_split_substring.map.with_index do |e, index|
      if index == 0
        e = "\n<ol>\n<li>#{e}</li>\n"
      elsif index == list_split_substring.length - 1
        e = "\n<li>#{e}</li>\n</ol>\n"
      else
        e = "<li>#{e}</li>"
      end
    end
    parsed_substring = parsed_list.join
  end

end
