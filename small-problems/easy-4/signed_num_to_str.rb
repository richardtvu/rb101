# Easy 4.10 https://launchschool.com/exercises/3c1388d3
=begin
Input: Integer
Output: String
Requirements:
- Include:
  - "+" in string if number is positive.
  - "-" if number is negative.
  - No sign if number is 0.

DS/Algo:
- Array.

Get sign based on whether number is 0, positive, or negative.
Get string for digits.
Return the sign + digits.

=end

DIGITS = %w(0 1 2 3 4 5 6 7 8 9)

def integer_to_string(num)
  num_str = num == 0 ? '0' : ''
  until num == 0
    num, remainder = num.divmod(10)
    num_str.prepend(DIGITS[remainder])
  end
  num_str
end

# Initial Solution
def get_sign(num)
  return '' if num == 0

  num > 0 ? '+' : '-'
end

def signed_integer_to_string(num)
  sign = get_sign(num)
  digits_str = integer_to_string(num.abs)
  sign + digits_str
end

# Further Exploraation/Refactored
def signed_integer_to_string(num)
  unsigned_num = integer_to_string(num.abs)
  case num <=> 0
  when -1 then "-#{unsigned_num}"
  when +1 then "+#{unsigned_num}"
  else             unsigned_num
  end
end

# Post-Student Solutions Review
def signed_integer_to_string(num)
  unsigned_num = integer_to_string(num.abs)
  return unsigned_num if num == 0

  get_sign(num) + unsigned_num
end

p signed_integer_to_string(4321) # == '+4321'
p signed_integer_to_string(-123) # == '-123'
p signed_integer_to_string(0)    # == '0'
