# Read the input.

input_string = File.read("input.txt")

# Initialize the window_array. The array has 3 elements to start. The 3 elements are the first 3 letters of the string input.

window_array = input_string[0..2].split(//)

# Initialize index_counter, starting value of 3. 

index_counter = 3

# while index_counter is less than the length of input_string,
#   push the letter at index of index_counter of the string input to the window_array
#   if the window_array contains unique elements,
#     break the loop
#   else
#     remove the first element of the window_array
#     increment index_counter by 1
# 
# output index_counter + 1
#

while index_counter < input_string.length
  window_array.push(input_string[index_counter])
  if window_array.uniq.length == window_array.length
    break
  else
    window_array.shift
    index_counter += 1
  end
end

puts index_counter + 1 # => 1623