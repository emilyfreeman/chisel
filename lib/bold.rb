require './lib/inline'

class Bold

  attr_accessor :splats

  def initialize
  end

  def parse(substring)
    if has_bold?(substring)
      bold_split = create_array_from_string(substring)
      locate_splat_pairs(bold_split)
      bold_format(bold_split)
    else
      substring
    end
  end

  def has_bold?(substring)
    substring.chars.count { |e| e == "*" } >= 4
  end

  def create_array_from_string(substring)
    bold_split = substring.chars
  end

  def locate_splat_pairs(bold_split)
    @splats = []
    bold_split.map.with_index do |e, index|
      if e == "*" && bold_split[index + 1] == "*"
        @splats << index
        bold_split.delete_at(index + 1)
      end
    end
  end

  def bold_format(bold_split)
    while @splats.length >= 2
        bold_split.map.with_index do |e, index|
          bold_split[@splats[0]] = "<strong>"
          bold_split[@splats[1]] = "</strong>"
        end
        @splats.shift(2)
    end
    parsed_substring = bold_split.join
  end

end
