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
        @splats << index
      end
    end
  end

  def italic_format(italic_split)
    while @splats.length >= 2
        italic_split.map.with_index do |e, index|
          italic_split[@splats[0]] = "<em>"
          italic_split[@splats[1]] = "</em>"
        end
        @splats.shift(2)
    end
    parsed_substring = italic_split.join
  end

end





  # def parse(substring)
  #   if has_italics?(substring)
  #     italic_split = create_array_from_string(substring)
  #     italic_format(italic_split)
  #   else
  #     substring
  #   end
  # end
  #
  # def has_italics?(string)
  #   first_splat_position = nil
  #   second_splat_position = nil
  #   string.chars.each_with_index do |char, index|
  #     if char == '*' && first_splat_position.nil?
  #       first_splat_position = index
  #     elsif char == '*' && !first_splat_position.nil?
  #       second_splat_position = index
  #       break
  #     end
  #   end
  #
  #   first_splat_position != second_splat_position && !first_splat_position.nil? && !second_splat_position.nil?
  #
  # end
  #
  # def create_array_from_string(substring)
  #   substring.split("*")
  # end
  #
  # def italic_format(italic_split)
  #   parsed_array = italic_split.map.with_index do |substring, index|
  #     if index.odd?
  #       substring = "<em>#{substring}</em>"
  #     else
  #       substring
  #     end
  #   end
  #   parsed_substring = parsed_array.join
  # end
