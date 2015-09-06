class Transition
  attr_accessor :name
  attr_accessor :gender

  def initialize
  end

  def emerge
    @gender = 'F' if @gender == 'M'
    @gender = 'M' if @gender == 'F'
    @name += 'imina' if @gender === 'F'
    @name += 'erson' if @gender === 'M'
  end

  def to_s
    "#{@name} is a #{@gender}"
  end


end

jon = Transition.new
jon.name = "Jon"
jon.gender = "M"
jon.emerge

# ---- for chizzle
# Get filename
markdown_filename = ARGV.first
# Get handle to file. By default "open" opens a file for read.
markdizzy = open(markdown_filename)
markdizzy_content = markdizzy.read
# Get filename
# ARGV is just and array of arguments after the name of the Ruby file being run
# So ARGV[1] is the SECOND argument.
html_filename = ARGV[1]
# Open file for WRITING
html_fizzle = open(html_filename, 'w')

string_to_write = "READ IN FILE #{markdown_filename} at #{Time.now.to_s} had content:\n#{markdizzy_content}"

# hztml = Chisel.parse(markdizzy_content)
# Then write out tue 'hztml' to the file (as below)

html_fizzle.write(string_to_write)
html_fizzle.close
