require './lib/bold'
require './lib/italic'

class Inline

  def initialize()
  end

  def parse(parsed_substring)
    bold_parsed = bold_format(parsed_substring)
    italic_format(bold_parsed)
  end

  def bold_format(substring)
    Bold.new.parse(substring)
  end

  def italic_format(substring)
    Italic.new.parse(substring)
  end

end
