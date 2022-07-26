=begin
Sum of Sums

- Inputs: Array
- Outputs: Integer
- Requirements:
  - The returned value shall be the sum of the sums of preceding sequences.
  - Array will contain at least 1 number.
  - Implicit:
    - A single-element array returns the element in the array.

Examples:
- [3, 5] => (3) + (3+5) => 11
- [0] => 0

# current_sum   = 0, 1, 6, 13, 16
# sum_of_sums   = 0, 1, 7, 20, 36
# previous_sum  = 0, 1, 6, 13, 16
                   , 1, 3, 6,  10, 15
                   , 1, 4, 10, 20, 35

Data Structures:
- Array

Algos:

- Initialize current_sum to 0.
- Initialize sum_of_sums to 0.

- Iterate through the array.
  - Set the current sum to be current_sum + current_value.
  - Set the sum_of_sums to sum_of_sums + current_sum
- Return the current sum.

Initialize current_sum to 0.
Initialize an empty arr, `sums`.
Iterate over the given array:
- Add current value to sum.
- Append current_sum to the sums arr.

Return the sum of elements in the sums arr.

Code with intent
=end

# Initial Solution - No arrays
def sum_of_sums(arr)
  current_sum = 0
  sum_of_sums = 0
  arr.each do |num|
    current_sum += num
    sum_of_sums += current_sum
  end
  sum_of_sums
end

# Array-based approach
def sum_of_sums(arr)
  current_sum = 0
  sums = arr.map { |num| current_sum += num }
  sums.sum
end

# Silly Refactoring of initial solution
def sum_of_sums(arr, current_sum = 0)
  arr.each_with_object([0]) do |num, sum_of_sums|
    sum_of_sums[0] += (current_sum += num)
  end [0]
end

p sum_of_sums([3, 5, 2])        #== (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3])     #== (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4])              #== 4
p sum_of_sums([1, 2, 3, 4, 5])  #== 35
