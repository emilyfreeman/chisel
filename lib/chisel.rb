require './lib/block'
require './lib/inline'

class Chisel

  def process(input_file, output_file)
    markdown = read_file(input_file)
    html = parse(markdown)
    write_file(html, output_file)
  end

  def read_file(input_file)
    markdown_handle = open(input_file)
    markdown_handle.read
  end

  def parse(markdown)
    block = Block.new
    block.parse(markdown)
  end

  def write_file(html, output_file)
    html_handle = open(output_file, 'w')
    html_handle.puts(html)
    html_handle.close
  end

end
