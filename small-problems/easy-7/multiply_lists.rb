=begin 
Multiply Lists

Inputs: 2 Arrays 
Outputs: Array 
- Requirements:
  - Multiply pairs of elements with same index 
  - Arrays have same elements. 

Data Structure?
- Algo 

Iterate over the first array. 
- Multiply the first elements of first and second array 

Return new array of products
=end

# Initial Solution 
def multiply_list(arr1, arr2) 
  product_arr = [] 
  arr1.each_with_index { |num, index| product_arr << num * arr2[index] }
  product_arr
end 

# Improved Solution based off Teresa T. 
def multiply_list(arr1, arr2) 
  arr1.zip(arr2).map { |arr| arr.inject(:*)}
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]