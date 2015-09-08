require './lib/inline'

class Bold

  attr_accessor :splats, :index

  def initialize
  end

  def parse(substring)
    if has_bold?(substring)
      format_substring(substring)
    else
      substring
    end
  end

  def has_bold?(substring)
    substring.chars.count { |e| e == "*" } >= 4
  end

  def format_substring(substring)
    bold_split = create_array_from_string(substring)
    locate_splat_pairs(bold_split)
    bold_format(bold_split)
  end

  def create_array_from_string(substring)
    bold_split = substring.chars
  end

  def locate_splat_pairs(bold_split)
    @splats = []
    bold_split.map.with_index do |e, index|
      if e == "*" && bold_split[index + 1] == "*"
        increase_splat_count(bold_split, index)
      end
    end
  end

  def increase_splat_count(bold_split, index)
    @splats << index
    bold_split.delete_at(index + 1)
  end

  def bold_format(bold_split)
    while @splats.length >= 2
      add_strong_tag(bold_split)
    end
    parsed_substring = bold_split.join
  end

  def add_strong_tag(bold_split)
    bold_split.map.with_index do |e, index|
      bold_split[@splats[0]] = "<strong>"
      bold_split[@splats[1]] = "</strong>"
    end
    @splats.shift(2)
  end

end
