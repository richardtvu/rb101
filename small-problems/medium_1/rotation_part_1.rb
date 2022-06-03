=begin 
- Input: Array 
- Output: Array 
- Requirements:
  - Don't modify the original array. 
  - Move the first element of the input array to the end of the array. 
  - Return a new array. 
  - Do not use rotate or rotate! 
  - When given a single element array, return the array. 

DS: 
- Array 

Algorithm: 
- Initialize a `doppelganger_arr` array to a duplicate of the input array. 
- Remove the first element from the `doppelganger_arr`.
- Append the removed element to the `doppelganger_arr`. 
- Return the `doppelganger_arr`.

=end 

# Initial Solution 
def rotate_array(arr) 
  doppelganger_arr = arr.clone 
  doppelganger_arr << (doppelganger_arr.shift)
end 

# Revised Solution after Viewing LS Solution 
def rotate_array(arr) 
  arr[1..] + [arr.first] 
end 

# p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# p rotate_array(['a']) == ['a']

# p x = [1, 2, 3, 4]
# p rotate_array(x) == [2, 3, 4, 1]   # => true
# p x == [1, 2, 3, 4]                 # => true

# Further Exploration 
def rotate_str(str) 
  rotate_array(str.chars).join
end 

p rotate_str("hi")

def rotate_int(num) 
  rotate_str(num.to_s).to_i 
end 

p rotate_int(123)
