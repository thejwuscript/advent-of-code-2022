# Part One

data_string = File.read('day 1 input.txt')
elves_weights = data_string.split("\n\n")
summed_weights = elves_weights.map do |weights|
  weights_array = weights.split("\n")
  weights_array.reduce(0) { |sum, weight| sum + weight.to_i }
end
puts summed_weights.max

# Part Two

descending_order_weights = summed_weights.sort { |a, b| b <=> a }
puts descending_order_weights.slice(0, 3).sum
