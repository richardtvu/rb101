=begin
Merge Sorted Lists

Write a method that takes two sorted Arrays as arguments, and returns a new Array that contains all elements from both arguments in sorted order.

You may not provide any solution that requires you to sort the result array. You must build the result array one element at a time in the proper order.

Your solution should not mutate the input arrays.

P
- I: Two sorted arrays
- O: _New_ array
- Requirements:
  - New array has all elements of inputs in ascending order.
  - No sorting result array.
  - Must build the array one element at a time in the proper order.
  - No mutating the input arrays.

  Questions:
  - Can we have non-Integers or negative numbers?
  - What happens when we get empty arrays?
    - Combine and return these arrays as a new array.
E
D
  - Order? Hash vs Array?
  - Hash - keep track of whether I've accounted for a number.
  - But hashes don't keep duplicate keys...
  - Ahh, then what I can do... is keep track of the counts of the integers.
  - Then, I can find the min of the keys.
  - Append the key , n times, to a new array.
  - Delete the key-value pair from the hash.
  - Then, find the minimum again.
  - Repeat above until no more keys are present.

    - Keep a tally of elements in both arrays.
    - Iterate over the keys in the tally:
      - Find the minimum number in the tally.
      - For the number of times the number occurs in the tally:
        - Append this number to a new array.
    - Return this new array.

=end

def merge(arr1, arr2)
  ordered_numbers = []

  number_frequency = arr1.tally(arr2.tally)
  numbers = number_frequency.keys
  numbers.sort!

  numbers.each do | number |
    number_frequency[number].times do
      ordered_numbers << number
    end
  end
  ordered_numbers

end

# Test cases

def run_tests

  test_cases = [
    [merge([1, 5, 9], [2, 6, 8]), [1, 2, 5, 6, 8, 9]],
    [merge([1, 1, 3], [2, 2]), [1, 1, 2, 2, 3]],
    [merge([], [1, 4, 5]), [1, 4, 5]],
    [merge([1, 4, 5], []) , [1, 4, 5]]
  ]

  test_cases.each do | test_case |
    p "Expected #{test_case.last}. Actual: #{test_case.first}"
    p "Pass? #{test_case.first == test_case.last}"
  end


  # Tests that we don't mutate the input arrays.
  arr1 = [1, 4, 5]
  arr1_pre_call_object_id = arr1.object_id
  arr2 = [1, 5, 9]
  arr2_pre_call_object_id = arr2.object_id

  p merge(arr1, arr2) == [1, 1, 4, 5, 5, 9]
  p arr1_pre_call_object_id == arr1.object_id && arr2_pre_call_object_id == arr2.object_id
end

# Solution
=begin
Iterate over the elements in the first array,
  Iterate over the indices in the second array until the element at the index for the second array is greater than the value for the first element.
    Append the current element for the second array to the new result array.
    Increment the index for the second array
  Append the value for the first array to the result array.

Concate the elements from index2 to the last element in array2 to the result array.

Why does this solution work?

- The solution works because the arrays are already sorted? Would the solution still work if the arrays weren't sorted?
- Why do we concatenate the array2 subarray to the results array?
  - Because ... the array2 array might have more elements than the array1?
- What about if we were to use strings?
=end

def merge(array1, array2)
  result = []
  index2 = 0

  array1.each do | number  |
    until index2 >= array2.size || array2[index2] > number
      result << array2[index2]
      index2 += 1
    end
    result << number
  end

  result.concat(array2[index2..-1])
end

=begin

=end
run_tests




