array_of_lines = File.readlines('input.txt', chomp: true)
answer_one = array_of_lines.reduce(0) do |result, line|
  outcome = case line
            when 'C X', 'A Y', 'B Z' then 6
            when 'A X', 'B Y', 'C Z' then 3
            else 0
            end

  case line
  when /X/ then shape = 1
  when /Y/ then shape = 2
  when /Z/ then shape = 3
  end

  result + shape + outcome
end
puts answer_one # => 14264

# -------------------- part two -----------------

answer_two = array_of_lines.reduce(0) do |result, line|
  case line
  when /X/ then outcome = 0
  when /Y/ then outcome = 3
  when /Z/ then outcome = 6
  end

  shape = case line
          when 'B Z', 'A X', 'C Y' then 3
          when 'A Z', 'B Y', 'C X' then 2
          else 1
          end

  result + outcome + shape
end

puts answer_two # => 12382
