=begin 

- Input: Integer, Integer (n >= 1)
- Output: Integer 
- Requirement:
  - Return the integer with the last `n` digits rotated. 

DS: 
- Array 

Algo: 
Convert the int to a string. 
Rotate the rightmost digits. 
Convert the string back into an int. 
=end 

def rotate_array(arr) 
  arr[1..] + [arr.first] 
end 

def rotate_str(str) 
  rotate_array(str.chars).join
end 

def rotate_rightmost_digits(num, n) 
  leftmost_digits_str   = num.to_s[0..-n-1]
  rightmost_digits_str  = num.to_s[-n..]
  
  rotated_num_str = leftmost_digits_str + rotate_str(rightmost_digits_str)
  rotated_num_str.to_i 
end 

# Revised solution after viewing LS solution 
def rotate_rightmost_digits(num, n) 
  all_digits = num.to_s.chars
  all_digits[-n..] = rotate_array(all_digits[-n..])
  all_digits.join.to_i 
end 

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917