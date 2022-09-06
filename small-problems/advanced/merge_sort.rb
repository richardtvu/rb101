# Merge Sort
=begin
https://launchschool.com/exercises/bf7055e5


What happens with recursion?

- There's a base case and 1+ recursive cases.

The base case stops the recursion.
The recursive case continues onward ... with returns..

Here's the template

if base_case
  return some_value

else if other_condition
  return the value of calling the method with some values

(... else if ... ) ....

... else

end

How does merge sort work?
1. Given a 1-dimensional array, split the elements into sub_arrays containing half of the array elements.
2. Repeat this splitting until each sub_array has at most 1 element.
3. Merge and sort pairs of sub-arrays.
4. Repeat until we've a sorted 1D array.
=end


def merge(arr1, arr2)
  idx2 = 0
  result = []

  arr1.each do |num|
    while idx2 < arr2.size && arr2[idx2] < num
      result << arr2[idx2]
      idx2 += 1
    end
    result << num
  end

  result.concat(arr2[idx2..-1])
end


def run_tests

  test_cases = [
    [merge([1, 5, 9], [2, 6, 8]), [1, 2, 5, 6, 8, 9]],
    [merge([1, 1, 3], [2, 2]), [1, 1, 2, 2, 3]],
    [merge([], [1, 4, 5]), [1, 4, 5]],
    [merge([1, 4, 5], []) , [1, 4, 5]]
  ]

  test_cases.each do | test_case |
    pass = test_case.first == test_case.last
    unless pass
      p "Expected #{test_case.last}. Actual: #{test_case.first}"
      p "Pass? #{pass}"
    end
  end



  # Tests that we don't mutate the input arrays.
  arr1 = [1, 4, 5]
  arr1_pre_call_object_id = arr1.object_id
  arr2 = [1, 5, 9]
  arr2_pre_call_object_id = arr2.object_id

  expected = [1, 1, 4, 5, 5, 9]
  actual = merge(arr1, arr2)
  result = expected == actual
  non_mutating = arr1_pre_call_object_id == arr1.object_id && arr2_pre_call_object_id == arr2.object_id

  if !result || !non_mutating
    p "Expected: #{expected}, Actual: #{actual}"
  end
end

run_tests

=begin PEDAC
P
I - Array
O - Sorted array
Reqs:
- Array will only have 1 type of data (<=> will be usable)
- The array elements will be nums or strings.

Implicit:
- Sort the arrays in ascending/non-descending order.
- Sort strings in ASCIIbetical order.
- When splitting arrays into nested arrays, split arrays into two arrays of approximately equal elements.
- Do not include empty arrays.

Do we return a _new_ array?

DS:
- Probably would use an array for ordered sequences.

A:

GIVEN array.
WHILE there are arrays with more than 1 element
  Split the arrays with more than 1 element into two sub-arrays with half the elements in each subarray.
At this point, we've a nested array in which the inner-most arrays have 1 element.

WHILE we've subarrays
  merge a pair of sub-arrays
  order the merged sub-array


=end

def merge_sort(array)

end