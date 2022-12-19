array_of_lines = File.readlines("input.txt", chomp: true)
answer_one = array_of_lines.reduce(0) do |result, line|

  case line
  when "C X", "A Y", "B Z" then outcome = 6
  when "A X", "B Y", "C Z" then outcome = 3
  else outcome = 0
  end

  case line
  when /X/ then shape = 1
  when /Y/ then shape = 2
  when /Z/ then shape = 3
  end

  result + shape + outcome
end
puts answer_one # => 14264