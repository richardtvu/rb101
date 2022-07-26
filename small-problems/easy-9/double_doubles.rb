=begin
Double Doubles

- Input: Integer
- Output: Integer
- Requirements:
  - Double numbers:
    - Have an even # of digits.
    - Can split the digits in half and each half will
    be equal to the other, e.g. '44' => '4' == '4'.
  - Return the product of the input if the input is a double number. Else return the input.

  Example:
    - 123123 => 123 == 123, so return 123123*2
    - 321321 => 321 == 321, so return 321321*2

Data Structure:
- Array

Algo:
- Split up the integer into its digits.
- Return the integer if the number of digits is odd.

- Compare the left half and right half
  - If the left half is equal to the right half, then return 2 * input integer
  - Else return the input integer
=end

def double_number?(digits)
  return false if digits.size.odd?

  mid = (digits.size / 2) - 1
  left_half = digits[0..mid]
  right_half = digits[mid + 1..-1]

  left_half == right_half
end

def twice(num)
  double_number?(num.digits) ? 2 * num : num
end

=begin
Double Doubles

- Input: Integer
- Output: Integer
- Requirements:
  - Double numbers:
    - Have an even # of digits.
    - Can split the digits in half and each half will
    be equal to the other, e.g. '44' => '4' == '4'.
  - Return the product of the input if the input is a double number. Else return the input.

  Example:
    - 123123 => 123 == 123, so return 123123*2
    - 321321 => 321 == 321, so return 321321*2

Data Structure:
- Array

Algo:
- Split up the integer into its digits.
- Return the integer if the number of digits is odd.

- Compare the left half and right half
  - If the left half is equal to the right half, then return 2 * input integer
  - Else return the input integer
=end

def double_number?(digits)
  return false if digits.size.odd?

  mid = (digits.size / 2) - 1
  left_half   = digits[0..mid]
  right_half  = digits[mid + 1..-1]

  left_half == right_half
end

def twice(num)
  double_number?(num.digits) ? num : 2 * num
end

p twice(37) == 74
p twice(44) == 44
p twice(334_433) == 668_866
p twice(444) == 888
p twice(107) == 214
p twice(103_103) == 103_103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10
