# Part One

# First, read the puzzle input line by line. Remove the \n escape sequence at the end of each line.
# The return value is an array of strings. Store this in a variable called rucksacks.

# eg. rucksacks = ["jEdAaA", "loQWxZPp", ...]

# Next, map over the array. For each element, split it into two halves that are equal in length. We do this by:
#   Find the length of the string and divide by 2. This gives us the middle index. Store this result in a variable middleIndex.
#   Slice the string, start is 0, end is middleIndex. Store the result in a variable compartment_one.
#   Slice the original string, start at middleIndex, end at the very end. Store the result in a variable compartment_two.
#   Use a function called find_shared_item_type(compartment_one, compartment_two) and return the result of the function.
  
# The #map method will return a new array. Store it in a variable called shared_item_types. It should look like the following:

# eg. shared_item_types = ["Y", "q", "b", ...]

# Next, reduce the shared_item_types array. Initial value of 0.
#   For each letter, pass the letter into a function called find_priority. The function returns a number that represents the priority.
#   Return accumulator + find_priority.

# The #reduce method returns a value that is sum of the priorities of the item types. That is the answer.
