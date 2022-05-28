=begin
Reversed Arrays (Part 2)

Write a method that takes an Array, and returns a new Array with the elements of the original list in reverse order. Do not modify the original list.

You may not use Array#reverse or Array#reverse!, nor may you use the method you wrote in the previous exercise.
---------------------------------------------

- Input: Array
- Output: Array (new arr, reversed)
- Requirements:
  - No Array#reverse or reverse! or method from last exercise.
  - Implicit Requirements:
    - Empty or single element array => array with same values.
    - Order matters.

Data Structures/Algo:
- Array

# e.g. [1, 2, 3, 4] => [4, 3, 2, 1]
# Iterate through array from the back to the front:
  # Add each element to a new array
# Return the new array.

# Copy the array.
# Swap elements based on mirrored positions.
=end

# Initial Solution
def reverse(arr)
  reversed_arr = []
  first_index = -arr.size
  index = -1
  until index < first_index
    reversed_arr.append(arr[index])
    index -= 1
  end
  reversed_arr
end

def reverse(array)
  rev_arr = [] 
  arr.reverse_each { |element| rev_arr << element }
  result_array
end 

# Further Exploration
def reverse(arr)
  arr.each_with_object([]) { |elem, rev_arr| rev_arr.prepend(elem) }
end


p reverse([])                   #== [] # => true
p reverse(['abc'])              #== ['abc'] # => true
p reverse([1, 2, 3, 4])         #== [4, 3, 2, 1] # => true
p reverse(%w(a b e d c))        #== %w(c d e b a) # => true

p list = [1, 3, 2]                          # => [1, 3, 2]
p new_list = reverse(list)                  # => [2, 3, 1]
p list.object_id                != new_list.object_id # => true
p list                          == [1, 3, 2] # => true
p new_list                      == [2, 3, 1] # => true
