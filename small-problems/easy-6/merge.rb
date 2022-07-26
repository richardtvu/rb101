=begin
Combining Arrays
Write a method that takes two Arrays as arguments, and returns an Array that contains all of the values from the argument Arrays. There should be no duplication of values in the returned Array, even if there are duplicates in the original Arrays.

- Input: 2 arrays
- Output: 1 Array
- Requirements:
  - Output array contains unique values of both arrays.

Example
merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

# Append one array to another array.
# Return the unique values
=end

# Initial Solution
def merge(arr1, arr2)
  combined_arr = arr1 + arr2
  combined_arr.uniq
end

def merge(arr1, arr2)
  arr1.union(arr2)
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
