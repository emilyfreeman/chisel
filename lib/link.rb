require './lib/inline'

class Link < Inline
  def parse(substring)
    if has_link?(substring)
  end

  def has_link?(substring)
    substring.include? "])"
  end

end
