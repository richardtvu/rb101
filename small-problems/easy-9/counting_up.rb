=begin

Input: Integer
Output: Array of Integers
- The array of integers will include all integers from 1 to the argument.
- Argument >= 1.

=end

def sequence(num)
  (1..num).to_a
end

p sequence(5)
p sequence(3)
p sequence(1)
