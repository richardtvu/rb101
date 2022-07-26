=begin
- Input: 2 integers (count, first num)
- Output: Array
- Reqs:
  - Array will contain `count` elements.
  - Array elements will be multiples of first num, starting at first num.
  - Count >= 0.
  - Starting num is an integer.
  - Return empty list when count is 0.

Data Structure
- Array

Algos:

Create an Array
For `count` times, append the next multiple to the array.

Create an array with count elements.
Transform each element into multiples of the starting_num.

=end

# Initial Solution
def sequence(count, first_num)
  multiples = [1] * count
  multiples.map.with_index { |_, i| first_num * (i + 1) }
end

# Refactored Solution
def sequence(count, first_num)
  multiples = Array.new(count, first_num)
  multiples.map.with_index { |num, i| num * (i + 1) }
end

# Revised Solution - Post LS
def sequence(count, first_num)
  (1..count).map { |val| val * first_num }
end

# Revised Post-Student
def sequence(count, first_num)
  multipliers = Array.new(count) { |i| i + 1 }
  multipliers.map { |multiplier| multiplier * first_num }
end

p sequence(5, 1)       == [1, 2, 3, 4, 5]
p sequence(4, -7)      == [-7, -14, -21, -28]
p sequence(3, 0)       == [0, 0, 0]
p sequence(0, 1_000_000) == []
