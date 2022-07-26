=begin
Does My List Include This?

Write a method named `include?`` that takes an Array and a search value as arguments. This method should return true if the search value is in the array, false if it is not. You may not use the Array#include? method in your solution.

- Inputs: Array, Object
- Output: Boolean
- Requirements:
  - The object shall be a search value to find in the array.
  - The output is true if search value is present, false otherwise.
  - No using #include?
  - Implicit Requirements:
    - Nil is a valid search object.
    - An array [nil] with a search value of nil will return true.
    - An empty array with a non-empty search value returns false.

DSA:
- Array

Iterate over the Array
- Return true if the search value equals any of the values
Return false
=end

# Initial Solution
def include?(arr, val)
  arr.each { |element| return true if element == val }
  false
end

# Enhanced. Credit: Alex Bair
def include?(arr, val)
  arr.any?(val)
end

p include?([1, 2, 3, 4, 5], 3) == true
p include?([1, 2, 3, 4, 5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false
