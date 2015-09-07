require './lib/inline'

class Paragraph

  def initialize
  end

  def parse(substring)
    format_paragraph(substring)
  end

  def format_paragraph(substring)
    parsed_substring = Inline.new.parse(substring)
    "\n<p>\n#{parsed_substring}\n</p>\n"
  end

end
