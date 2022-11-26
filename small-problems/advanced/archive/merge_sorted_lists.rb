=begin
Merge Sorted Lists

Write a method that takes two sorted Arrays as arguments, and returns a new Array that contains all elements from both arguments in sorted order.

You may not provide any solution that requires you to sort the result array. You must build the result array one element at a time in the proper order.

Your solution should not mutate the input arrays.

merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
merge([], [1, 4, 5]) == [1, 4, 5]
merge([1, 4, 5], []) == [1, 4, 5]

I - 2 Arrays
O - Array
R:
- Return a new array of all elements in non-decreasing order.
- Do not sort the result array.
- Build result array one element at a time in proper order.

Data Structure:
- Array

Algorithm:
- Create a temp array to store all the elements.
- Create a result_arr.
- Until there are no more elements in the temp array, append the smallest element to the result_arr.
- Return the result_arr.

=end



def merge(first_arr, second_arr)
  temp_arr = first_arr + second_arr
  result_arr = []

  until temp_arr.empty?

    result_arr << temp_arr.delete(temp_arr.min)
  end

  p result_arr
end

merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
merge([], [1, 4, 5]) == [1, 4, 5]
merge([1, 4, 5], []) == [1, 4, 5]