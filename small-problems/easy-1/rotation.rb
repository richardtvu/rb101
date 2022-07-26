=begin
Rotation

Problem:
- Input: Array
- Output: Array
- Requirements:
  - The last element of the returned array will be the first element of the original array.
  - Do not use #rotate or #rotate!.
  - Do not mutate the original array.
  - Implicit requirements:
    - The value of the original array shall be the same before and after calling rotate_array.
    - Do not use mutating methods (e.g. shift, unshift, push, pop, etc) on the original array.

Examples:

Data Structure:
- Array

Algorithm:
# GIVEN an array
# SET rotated_arr = a clone of the array
# Remove the first element of the rotated arr
# Take that first element and put it at the end of the rotated_arr.
# return the rotated_array.

=end

def rotate_array_mine(arr)
  rotated_arr = arr.clone
  rotated_arr.push(rotated_arr.shift)
end

def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

def rotate_arr_str(str)
  chars = str.split('')
  rotated_chars = chars[1..-1] + [chars[0]]
  rotated_chars.join
end

def rotate_arr_int(num)
  digits = num.to_s.split('')
  rotated_digits = digits[1..-1] + [digits[0]]
  rotated_digits.join.to_i
end
p rotate_arr_int(123)
p rotate_arr_str('Hello World')

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(%w(a b c)) == %w(b c a)
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true
