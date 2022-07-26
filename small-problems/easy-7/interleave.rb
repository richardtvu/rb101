=begin
Combine Two Lists

Write a method that combines two Arrays passed in as arguments, and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation.

You may assume that both input Arrays are non-empty, and that they have the same number of elements.

Inputs: 2 Arrays
Output: Array
Requirements:
- Input arrays are same size.
- Output array contains all elements of both arrays.
- Elements will be alternating in output array.
Implicit Requirements:
- Order matters.
- The first array's element goes first.

Example:

Data Structures/Algos
- Array

Algos :
Iterating over the size of the first array
- Remove the current element from first array and add to the output array.
- Remove the current element from second array and add to the output array.
Return the output array.

=end

# Initial Solution
def interleave(arr1, arr2)
  size = arr1.size
  interleaved_arr = []
  size.times do |index|
    interleaved_arr << arr1[index]
    interleaved_arr << arr2[index]
  end
  interleaved_arr
end

# Further Exploration
def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

p interleave([1, 2, 3], %w(a b c)) #== [1, 'a', 2, 'b', 3, 'c']
