=begin
Convert a String to a Number!
https://launchschool.com/exercises/192719a5

=end

# My Solution
CHAR_DIGITS_HASH = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def char_to_digit(char)
  CHAR_DIGITS_HASH[char]
end

def transform_digits_numbers(digits)
  multiplier = 1
  index = -1
  digits_translated = []
  while index.abs <= digits.size
    digits_translated << (digits[index] * multiplier)
    multiplier *= 10
    index -= 1
  end
  digits_translated.reverse
end

def string_to_integer(str)
  digits = []
  str.chars.each do |char|
    digit = char_to_digit(char)
    digits << digit
  end

  digits = transform_digits_numbers(digits)
  digits.sum
end

# Revised Solution, after looking at answer and taking a long break

=begin
Convert a String to a Number!

Problem:
- Input: String (of digits)
- Output: Integer
- Requirements:
  - Cannot use to_i or Integer() constructor or other built-in conversion methods.
  - Ignore the +/- signs.
  - Inputs will be valid numeric characters.

Examples:
string_to_integer('4321') == 4321
string_to_integer('570') == 570

Data Structure:
- Array

Algorithm:
Get the digits in the string.
Convert the digits into the places.
Add the numbers together to get the output Integer.
Return the Integer.

Lower-level:
Initialize a local variable `digits_arr` to the characters in the given string.
Convert the characters into integers. e.g. ['4', '3'] => [4, 3]
Reassign the `digits_arr` to the integers converted above.
Initialize a local variable `sum` to 0.
Iterate over each digit in `digits_arr`: # [2, 1, 3]: expect 213
- Multiply sum by 10.
- Add the digit to the sum.
Return the sum.
=end

#  e.g. ['4', '3'] => [4, 3]
def convert_to_ints(chars_arr)
  char_to_ints_hash = {
    '0' => 0, '1' => 1, '2' => 2,
    '3' => 3, '4' => 4, '5' => 5,
    '6' => 6, '7' => 7, '8' => 8,
    '9' => 9
  }
  chars_arr.map { |char| char_to_ints_hash[char] }
end

# p convert_to_ints(['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']) # Expect [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

def string_to_integer(str)
  digits_arr = str.chars
  digits_arr = convert_to_ints(digits_arr)
  sum = 0
  digits_arr.each do |digit|
    sum *= 10
    sum += digit
  end
  sum
end

# Revise code again after reviewing Launch School solution:

DIGITS = {
  '0': 0, '1': 1, '2': 2, '3': 3, '4': 4,
  '5': 5, '6': 6, '7': 7, '8': 8, '9': 9
}

def string_to_integer(string)
  digits_arr = string.chars.map { |char| DIGITS[char.to_sym] }
  sum = 0
  digits_arr.each { |digit| sum = (sum * 10) + digit }
  sum
end

p string_to_integer('4321') #== 4321
p string_to_integer('570')  #== 570

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
