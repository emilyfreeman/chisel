# class Bold
#   attr_accessor :splats
#
#   def initialize
#   end
#

#
#   def find_splat_index(arr)
#     @splats = []
#     arr.map.with_index do |e, index|
#       if e == "*" && arr[index + 1] == "*"
#         @splats << index
#         arr.delete_at(index + 1)
#       end
#     end
#   end

#   puts splat_number_even?(arr)
#   puts arr.inspect
#   puts @splats.inspect
#
# end
#
arr = ["n","m","*","*","p", "*", "*","r", "*", "m"]
# p = Bold.new

splats = []
arr.map.with_index do |e, index|
  if e == "*" && arr[index + 1] == "*"
    splats << index
    arr.delete_at(index + 1)
  end
end
puts arr.inspect
puts splats.inspect

if splats.length >= 2
  arr.map.with_index do |e, index|
    arr[splats[0]] = "<strong>"
    arr[splats[1]] = "</strong>"
  end
  splats.shift(2)
end

puts splats.inspect
puts arr.join
