# # ---- for chizzle
# # Get filename
# markdown_filename = ARGV.first
# # Get handle to file. By default "open" opens a file for read.
# markdizzy = open(markdown_filename)
# markdizzy_content = markdizzy.read
# # Get filename
# # ARGV is just and array of arguments after the name of the Ruby file being run
# # So ARGV[1] is the SECOND argument.
# html_filename = ARGV[1]
# # Open file for WRITING
# html_fizzle = open(html_filename, 'w')
#
# string_to_write = "READ IN FILE #{markdown_filename} at #{Time.now.to_s} had content:\n#{markdizzy_content}"
#
# # hztml = Chisel.parse(markdizzy_content)
# # Then write out tue 'hztml' to the file (as below)
#
# html_fizzle.write(string_to_write)
# html_fizzle.close
#
# string = "##Heading\n\nFirst paragraph with **bolded** text.\n\nSecond paragraph with more **bolding**.\n\n####Level 4 Heading\n\nLast paragraph."


# g = Chisel.new
# g.parse(string)
