=begin 

- Input:  Numeric 
- Output: Numeric
- Requirements: 
  - Return the negative of a positive input.
  - Return the original number if that number is 0 
  or negative. 

=end 

def negative(num) 
  num <= 0 ? num : -num 
end 

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby