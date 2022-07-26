=begin

Problem:
- Input: Numeric
- Output: Numberic (Integer)?
- Requirements:
  - Rotate the last n digits of the number input.
  - A 1 digit rotation returns the original number.
  - n is always positive (1+)?

  - What about if the `n` is 0? Is that possible? Then, just do no rotation.
Examples:

Data structures?
- An array to keep track of the digits.
- Either 1 or 2 arrays, depending on whether I want to mutate the original array.

ALgorithm:

# START
# GIVEN a number and `n`, e.g. 123, 2 => 132
# Split the number into digits.
# Grab the last n digits.
# Rotate the last n digits.
# Grab the first digits before the last `n` digits.
# Return the addition of the first digits with the rotated last n digits.
# END

=end

def rotate_array(num)
  digits = num.to_s.split('')
  rotated_digits = digits[1..-1] + [digits[0]]
  rotated_digits.join.to_i
end

def rotate_rightmost_digits(num, n) # e.g 735291, 2
  digits = num.digits.reverse # [7, 3, 5, 2, 9, 1]
  last_n_digits = digits[-n..digits.size - 1].join.to_i # 91
  rotated_digits_arr = rotate_array(last_n_digits).digits.reverse
  rotated_num_arr = digits[0...digits.size - n] + rotated_digits_arr

  rotated_num_arr.join.to_i
end

p rotate_rightmost_digits(735_291, 1) == 735_291
p rotate_rightmost_digits(735_291, 3) == 735_912
p rotate_rightmost_digits(735_291, 2) == 735_219
p rotate_rightmost_digits(735_291, 4) == 732_915
p rotate_rightmost_digits(735_291, 5) == 752_913
p rotate_rightmost_digits(735_291, 6) == 352_917
