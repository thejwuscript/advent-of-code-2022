# We will use the stack data structure. So that is first in, first out.
#
# The first challenge is to read the input and organize it into 9 stacks. This way, we can perform stack operations like push() and pop().
#
# Initialize lines_of_crates empty array.
#
# First, we will read the input. Next, loop over the lines.
# until the string does not start with "[", do the following:
#   Push the string array into lines_of_crates.
#
# "[L]     [W] [B]     [G]         [R]"
#
# Next, split the string into 9 elements. The desired result is:
#
# lines = [["L", nil, "W", "B", nil, "G", nil, nil, "R"], ...]
#
# Next, if we are allowed to use #zip, then use #zip to simplify the algorithm.
#
# Otherwise, initialize a new array called stacks_of_crates. This will be a 2d array. Use double loop to loop over lines and push elements into the stacks_of_crates 2d array one by one.
#
# Remove the nil elements.


lines_of_crates = []
lines = File.readlines('input.txt', chomp: true)

i = 0
while lines[i][0] == '['
  lines_of_crates.push(lines[i])
  i += 1
end

lines_of_crates.map! { |str|
  new_str = str.gsub(/\[|\]/, '')
  another_str = new_str.gsub(/\s\s\s\s/, ' nil')
  another_str.split(' ')
}

stacks_of_crates = Array.new(9) {Array.new}

for i in 0..8 do
  for j in 0..7 do
    letter = lines_of_crates[j][i]
    
    break if letter.nil?
    stacks_of_crates[i].push(letter)
  end
end

organized_stacks = stacks_of_crates.map do |stack|
  stack.reverse!
  index = stack.index("nil")
  next stack if index.nil?

  stack.slice(0, index)
end

puts organized_stacks
