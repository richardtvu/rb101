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

DIGITS_STRS = {
  0=> '0', 1=> '1', 2=> '2', 3=> '3', 4=> '4', 
  5=> '5', 6=> '6', 7=> '7', 8=> '8', 9=> '9'
}

def digit_to_str(digit)
  DIGITS_STRS[digit]
end 
# (0..9).each { |digit| p digit_to_str(digit)}


def integer_to_string(num) 
  digits_str = num.digits.reverse.map do |digit_char| 
    digit_to_str(digit_char)
  end 
  digits_str.join 
end 

p integer_to_string(4321) #== '4321'
p integer_to_string(0)    #== '0'
p integer_to_string(5000) #== '5000'