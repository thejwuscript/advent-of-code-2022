# Part One

def find_shared_item_type(ary_one, ary_two)
  ary_one.find { |item| ary_two.include?(item) }
end

def find_priority(letter)
  if letter == letter.upcase
    letter.ord - 38
  else
    letter.ord - 96
  end
end

# First, read the puzzle input line by line. Remove the \n escape sequence at the end of each line.
# The return value is an array of strings. Store this in a variable called rucksacks.

# eg. rucksacks = ["jEdAaA", "loQWxZPp", ...]

rucksacks = File.readlines('input.txt', chomp: true)

# Next, map over the array. For each element, split it into two halves that are equal in length. We do this by:
#   Find the length of the string and divide by 2. This gives us the middle index. Store this result in a variable middleIndex.
#   Slice the string, start is 0, end is middleIndex. Split the string into an array. Store the result in a variable compartment_one.
#   Slice the original string, start at middleIndex, end at the very end. Split the string into an array. Store the result in a variable compartment_two.
#   Use a function called find_shared_item_type(compartment_one, compartment_two) and return the result of the function, which should be a letter.

# The #map method will return a new array. Store it in a variable called shared_item_types. It should look like the following:

# eg. shared_item_types = ["Y", "q", "b", ...]

shared_item_types = rucksacks.map do |rucksack|
  middle_index = rucksack.length / 2
  compartment_one = rucksack.slice(0, middle_index).split(//)
  compartment_two = rucksack.slice(middle_index..-1).split(//)
  find_shared_item_type(compartment_one, compartment_two)
end

# Next, reduce the shared_item_types array. Initial value of 0.
#   For each letter, pass the letter into a function called find_priority.
#   Return accumulator + find_priority.

# The #reduce method returns a value that is sum of the priorities of the item types. That is the answer.

# Update: ***Cannot use #reduce directly on a string array with a initial value of 0 due to TypeError***
# Solution: #map then #reduce

puts shared_item_types.map { |item| find_priority(item) }.reduce(:+) # => 8176

#--------Part Two--------

common_item_types = []

i = 0
while i < rucksacks.length
  group = rucksacks.slice(i, 3)
  common_type = (group[0].split(//) & group[1].split(//) & group[2].split(//))[0]
  common_item_types.push(common_type)
  i += 3
end

puts common_item_types.map { |item| find_priority(item) }.reduce(:+) # => 2689
