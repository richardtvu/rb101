# Easy 4.9: https://launchschool.com/exercises/cdc65476
=begin 
- Input: Integer 
- Output: String 
- Requirements: 
  - Input will be a whole #, 0 or greater. 
  - No built-in methods 

Data Structures
- Array 

Algo: 
Iterate through each digit in digits 
  Convert digit into a str
Combine the digit strings together 
Return the whole number string 

=end 

# Initial Solution Revised
DIGITS = {
  0=> '0', 1=> '1', 2=> '2', 3=> '3', 4=> '4', 
  5=> '5', 6=> '6', 7=> '7', 8=> '8', 9=> '9'
}


def integer_to_string(num) 
  digits_arr = num.digits.reverse.map {|digit_char| DIGITS[digit_char]}
  digits_arr.join 
end

# Revision  based on LS solution 
# DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

# def integer_to_string(num) 
#   num == 0 ? num_str = "0" : num_str = ""
#   until num == 0 
#     num, remainder = num.divmod(10) 
#     num_str.prepend(DIGITS[remainder])
#   end
#   num_str 
# end 


p integer_to_string(4321) #== '4321'
p integer_to_string(0)    #== '0'
p integer_to_string(5000) #== '5000'