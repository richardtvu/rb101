# Reversed Arrays
=begin
https://launchschool.com/exercises/eec5e591

Input: Array
Output: Array (with elements in reverse order)
- Requirements:
  - Output array must be the same array object passed in.
  - No #reverse or #reverse! Array methods.
  - Implicit requirements:
    - When given an array with 0 or 1 elements, return the array without modification.

Data Structures
- Array

Algorithm?

Iterating through each element of the list:
- Take the element and move the element to the front.
Return the array.

Alt:
Create a reversed_list.
Iterate through the list.
- Remove the last element.
- Add the last element to the reversed_list.
Add the elements in the reversed_list to the list.
Return the list Array.

=end

def reverse!(list)
  temp_list = []
  temp_list << list.pop until list.size == 0
  (list << temp_list).flatten!
end

p list = [1, 2, 3, 4]
p result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.equal?(result) # true
p
p list = %w(a b e d c)
p reverse!(list) == %w(c d e b a) # true
p list == %w(c d e b a) # true
p
p list = ['abc']
p reverse!(list) == ['abc'] # true
p list == ['abc'] # true
p
p list = []
p reverse!(list) == [] # true
p list == [] # true
