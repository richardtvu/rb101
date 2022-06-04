=begin 
- Input: Number
- Output: Number 
- Req: 
  - Rotate the entire number left by 1. Then, rotate left the digits after the first. Repeat with digits after 2nd, 3rd, ... until you rotate the last 2 digits. 
  - Return the maximum rotation of the original number. 
  - No need to handle multiple 0s. 

Data Structure? 
- Array 

Algorithm: 
Initialize last_n to be the number of digits in the number. 
While there are still at least 2 digits to rotate: 
- Rotate the last_n digits.
- Decrement last_n. 


Return the rotated number. 


=end 

def rotate_array(arr) 
  arr[1..] + [arr.first] 
end 

def rotate_rightmost_digits(num, n) 
  all_digits = num.to_s.chars
  all_digits[-n..] = rotate_array(all_digits[-n..])
  all_digits.join.to_i 
end 

# Initial Solution 
def max_rotation(num) 
  last_n_digits = num.to_s.size 
  until last_n_digits < 2
    num = rotate_rightmost_digits(num, last_n_digits)
    last_n_digits -= 1
  end
  num 
end 

# Revised Solution Post-View LS 
def max_rotation(num)
  num_digits = num.to_s.size 
  num_digits.downto(2) do |last_n_digits|
    num = rotate_rightmost_digits(num, last_n_digits)
  end 
  num
end 





p max_rotation(735291)        #== 321579
p max_rotation(3)             #== 3
p max_rotation(35)            #== 53
p max_rotation(105)           #== 15 # zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845