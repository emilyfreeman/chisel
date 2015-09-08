require './lib/inline'

class Italic

  def initialize
  end

  def parse(substring)
    if has_italic?(substring)
      italic_split = create_array_from_string(substring)
      locate_splats(italic_split)
      italic_format(italic_split)
    else
      substring
    end
  end

  def has_italic?(substring)
    substring.chars.count { |e| e == "*" } >= 2
  end

  def create_array_from_string(substring)
    italic_split = substring.chars
  end

  def locate_splats(italic_split)
    @splats = []
    italic_split.map.with_index do |e, index|
      if e == "*"
        increase_splat_num(italic_split, index)
      end
    end
  end

  def increase_splat_num(italic_split, index)
    @splats << index
  end

  def italic_format(italic_split)
    while @splats.length >= 2
      map_italic_split(italic_split)
      @splats.shift(2)
    end
    parsed_substring = italic_split.join
  end

  def map_italic_split(italic_split)
    italic_split.map.with_index do |e, index|
      italic_split[@splats[0]] = "<em>"
      italic_split[@splats[1]] = "</em>"
    end
  end
end
