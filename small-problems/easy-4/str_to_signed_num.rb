def make_ints(chars_arr)
  ints = {
    '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
    '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
  }
  chars_arr.map { |char| ints[char] }
end

def string_to_integer(digits_str)
  digits = make_ints(digits_str.chars)
  sum_arr = digits.each_with_object([0]) do |digit, sum|
    sum[0] *= 10
    sum[0] += digit
  end
  sum_arr.first
end

=begin
Input: String of digits
Output: Integer
- Requirements:
  - If the string has a + or no sign, return a positive number.
  - If the string has a -, return a negative number.
  - Input is always valid.
  - No built-in conversion methods.

Data Structure:
- Array

Algorithm:
Given a string containing a valid number, str.
If there is a - sign, then return a negative number.
Else return a positive number.

How to check - sign?
Get the first charaacter in the string.
If the first character is equal to '-', then return the a negative number.

=end

# My attempt
# SIGNED = ['+', '-']

# def string_to_signed_integer(num_str)
#   first_char = num_str[0]
#   if SIGNED.include?(first_char)
#     num = string_to_integer()
#     return -num if first_char == '-'
#     return  num if first_char == '+'
#   end
# end

# Revision after looking at LS solution. I like the case statement here for clarity and organization.



def string_to_signed_integer(num_str)
  case num_str[0]
  when '-' then -string_to_integer(num_str[1..-1])
  when '+' then  string_to_integer(num_str[1..-1])
  else           string_to_integer(num_str)
  end
end

## Further Exploration Drafting? 

def string_to_signed_integer(num_str)
  sign = num_str if num_str[0] == '-' || num_str[0] == '+' 
  unsigned_num = num_str[1..-1] if sign 
  case num_str[0]
  when '-', '+' then 
    num = string_to_integer(num_str[1..-1])
  else           
  end
  return -num if num_str[0] == '-'
  return num if num_str[0] == '+' 
  string_to_integer(num_str)
end


def string_to_signed_integer(string)
  result = string_to_integer(string.delete('^0-9'))
  string[0] == '-'? -result : result 
end 

p string_to_signed_integer('4321') #== 4321
p string_to_signed_integer('-570') #== -570
p string_to_signed_integer('+100') #== 100
