string = "#Heading\n\nParagraph with **bold elephants** loki **bold monkey** words."

chars = string.chars

last_char = ""
stars = []
bold_string = []
parsed_string = ""

chars.each do |e|
  if e == "*"
    if bold_string.empty?
      if stars.empty?
        stars << e
        last_char = e
        next
      elsif last_char == "*" && stars.length == 1
        stars << e
        last_char = e
        next
      end
    else
      if stars.length == 2
        stars.pop
        next
      elsif stars.length == 1 && last_char == "*"
        parsed_string += " <b>#{bold_string.join}</b> "
        stars = []
        bold_string = []
        next
      end
    end
  end

  if stars.length == 2
    bold_string << e
  end
  parsed_string += e

  last_char = e

end

puts parsed_string
