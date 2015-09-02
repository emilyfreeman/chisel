require 'pry'  # => true

class Chisel

  def initialize
  end

  def parse(string)
    if string.start_with?("#")
      parse_heading(string)
    else
      parse_paragraph(string)
    end
  end

  def parse_heading(string)
    num_of_hash = string.count "#"
    new_string = string.delete! "#"
    new_string.strip!
    "<h#{num_of_hash}>#{new_string}</h#{num_of_hash}>"
  end

  def parse_paragraph(string)
    if string.include? "\n\n"

      "<p>#{string}</p>"
    end
  end


end

# # edge case for multiple hashes
# new_string = string.chars.group_by { |e| e == "#" }
# new_string[true].count













# class Headings
#
#   def initialize(string)
#     @string = string
#   end
#
#   def heading?
#     @string.each_char.take_while {|e| e == "#"}.length == 1
#   end
#
#   def render
#     new_string = @string.each_char.drop_while {|e| e == "#"}.join.strip
#     "<h1>#{new_string}</h1>"
#   end
#
# end
#
# string = "# I am a heading"
# evaluated = Markdown.new(string)
#
# if evaluated.heading_one? == true
#   puts evaluated.render
# end
