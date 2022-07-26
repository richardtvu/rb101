=begin
Multiplicative Average

Write a method that takes an Array of integers as input, multiplies all the numbers together, divides the result by the number of entries in the Array, and then prints the result rounded to 3 decimal places. Assume the array is non-empty.

Input: Array of Integers
Output: Float
- Requirement:
  - Get the product of integers divided by the number of Integers
  - Round the result down to 3 decimal places.
  - Assume non-empty array.

Data Structure?
- Array

Get product.
Divide by the Float number of Integers.
Round _down_ to 3 decimal places.

=end

def show_multiplicative_average(arr)
  average = arr.inject(&:*) / arr.size.to_f
  puts format('%.3f', average)
end

show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667
