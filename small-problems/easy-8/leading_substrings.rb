=begin 
Leading Substrings 

- Input: String 
- Output: Array 
- Requirements: 
  - Output all of the substrings of string that start from beginning of original. 
  - Sort by increasing size. 
  - Implicit Requirements: 
    - No duplicates. 
    - A single character string returns a single element array. 

Data Structure: 
- Array 

Algorithm: 
- Initialize an empty arr for the substrings. 
- Iterate over the string. 
  - Add the substring from the beginning to the string to the current character to the substrings arr. 
- Return the arr. 
=end 

# Initial Solution (inspired by Sum of Sums solution)
def leading_substrings(str) 
  substrings_arr = [] 
  1.upto(str.size) do |count| 
    substrings_arr << str.slice(0, count) 
  end 
  substrings_arr 
end 


# Silly solution 
def leading_substrings(str) 
  str.chars.map.each_with_object(['']) do |char, substrings_arr|
    substrings_arr << substrings_arr.last + char 
  end[1..]
end 

# With index! Cr: Adam D. 
def leading_substrings(string)
  string.chars.map.with_index { |_, i|string[0..i] } 
end 

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a')    == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']