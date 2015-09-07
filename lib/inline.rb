require './lib/bold'
require './lib/italic'

class Inline

  def initialize()
  end

  def parse(parsed_substring)
    bold_format(parsed_substring)
    italic_format(@bold_parsed_substring)
  end

  def bold_format(substring)
    @bold_parsed_substring = Bold.new.parse(substring)
  end

  def italic_format(substring)
    parsed_substring = Italic.new.parse(substring)
  end

end
