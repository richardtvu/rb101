=begin
Input: Integer
Output: Integer
- Requirements:
  - Digits in input will be reversed.
  - Don't worry about leading zeros. Remove leading zeros.

Data Structures?
Array
- Split apart the numbers.
- Reverse the order.
- Join the numbers.

- Split the numbers.
- Reverse the order.
- Iterate over the digits.
  - Multiply the whole_num  by 10.
  - Add the digit to the whole_num.
Return the whole_number.
=end

# Initial Solution
def reversed_number(num)
  num.digits.map(&:to_s).join.to_i
end

# Refactored with inject.
def reversed_number(num)
  num.digits.inject(0) { |sum, num| sum = (sum * 10) + num }
end

# Logical-steps-based solution
def reversed_number(num)
  num.to_s.reverse.to_i
end

p reversed_number(12_345) #== 54321
p reversed_number(12_213) == 31_221
p reversed_number(456) == 654
p reversed_number(12_000) == 21 # No leading zeros in return value!
p reversed_number(12_003) == 30_021
p reversed_number(1) == 1
