# --------- Part One -----------
require 'set'

# Read the input file
# Initialize number_of_pairs with an initial value of 0

# Iterate over the array, split each string at hyphen(-) and comma(,). We then get this:
# [['2', '4', '6', '8'], ['2', '3', '4', '5'], ...]
# Then for each sub-array, check if 1st element is between the 3rd and 4th AND 2nd elem is between 3rd and 4th
# OR 3rd elem is between 1st and 2nd AND 4th elem is between 1st and 2nd

# increment number_of_pairs

lines = File.readlines('input.txt', chomp: true)

number_of_pairs = 0

lines.each do |line|
  a, b, c, d = line.split(/,|-/).map(&:to_i)
  number_of_pairs += 1 if a.between?(c, d) && b.between?(c, d) ||
                          c.between?(a, b) && d.between?(a, b)
end

puts number_of_pairs
