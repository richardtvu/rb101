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
    digits_translated << digits[index] * multiplier
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

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570



