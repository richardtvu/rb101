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


p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
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


=end 
