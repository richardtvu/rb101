=begin
Halvsies

Write a method that takes an Array as an argument, and returns two Arrays (as a pair of nested Arrays) that contain the first half and second half of the original Array, respectively. If the original array contains an odd number of elements, the middle element should be placed in the first half Array.

- Input: Array
- Output: Nested Arrays
- Requirements:
  - Output array will split elements of original array in half and assign these halves to the pair of nested arrays.
  - When # elements is odd, add the middle element to the first half.
  - An empty array => array of 2 empty arrs.
  - A single element array => arr of a single and a no-element array

Data Structure/Algos
- Array

Get the size of the input array and divide by 2.
Round that product, n, up to the nearest integer.
Add the first n elements as an array into the output array.
Add the last elements as an array into the output array.

=end

# Initial Solution
def halvsies(arr)
  output_arr = []
  half_way = (arr.size / 2.0).ceil - 1
  first_half = arr.empty? ? [] : arr[0..half_way]
  second_half = arr.empty? ? [] : arr[half_way + 1..-1]
  output_arr << first_half << second_half
end

# Updated Solution

def halvsies(arr)
  half = (arr.size / 2.0).ceil
  first_half = arr[0, half]
  second_half = arr[half, arr.size - half]
  [first_half, second_half]
end

# Further Exploration
=begin

The solution divides arr.size by 2.0 instead of just 2 because dividing an integer by an integer will only produce a whole number, e.g. 3/2 = 1, not 2.

=end
p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
