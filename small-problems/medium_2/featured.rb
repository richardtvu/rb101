=begin

Next Featured Number... Do-over.

Input: Integer
Output: Integer
Requirements:
- Featured num is an odd num divisible by 7 with all unique digits.
  - e.g. 49 is a featured num because 49 % 7 is 0.
  - 98 is not because it's even.
  - 133 is not because 3 is repeated.
  - e.g. the next featured num for an input of 1 would be 7.

- Return the next featured num or an error message if there isn't one.
- How do we know when there is no next featured number? I guess, when we've stopped having unique numbers ...
  e.g. 9876543201 would probably be the upper limit because it's odd, has unique digits. However, that num would not be a featured number because ... it's not divisble by 7 (I think).
- Implicitly: The maximum featured number is < 9_876_543_201.
- The next featured numbers, must be at least 14 integers apart (e.g. 7 and 21) because if the number is divisble by 14... then the number is even and thus cannot be a featured number.
- Therefore, our algorithm for producing a featured number would be add 14... 7 -> 21 -> 35 -> 49 -> 63 -> 77 ... and so on.

Data Structure -
- Integer, ... just another integer ...
- Maybe an array? for finding unique digits.
  - i.e. a featured num will be the same as the return value of getting the unique digits in the featured number and recombining the digits.

Algorithm:
- Given an integer...
- Find the next number divisible by 7... that's also ... an odd number and has unique digits.
- ...

- If the input integer is divisible by 7 and odd, then add 14 until we ge ta featured number.
- Else if the input integer is not divisible by 7, but is odd, then add 14 - remainder.
  - If the next num is not a featured num, add 14 until we get to it.
- Else
  - Hmmm... if the number is divisible by 7 but is even, add 7... THen add 14 if not a featured number.

Example...

- 21 --> Is a featured num, so add 14, to get the next.
- 20 --> is not featured and is even, so add 1 to get next odd, divisible by 7 num, 21. 21 hsa unique digits, so return 21.
- 997 --> 994 + (3) + 4 to get divisible by 7... --> 1001 but not unique, so add 14 ... 115, but not unique, so add 14 129 ... finally featured. so return 1029.

Algorithm:
- Check if a number is a featured num... if so, add 14 until we find the next featured num.
- Given a number, get the next number that is odd and divisible by 7.
- Return this unmber if num is a featured number.
- ELse... add 14 until we get a featured num.
- REturn the featured num.

Odd, unique digits, and divisible by 7.

Starting_point.
For each number after 12...
  If the number is odd and if the number is divisible by 7... then set starting point.

Until the potential_featured_num is a featured num:
- Add 14 to the potential featured number.

Return the featured num.
=end

UPPER_LIMIT = 9_876_543_201 # * See after code for explanation.

# Helper method solution:
# This solution, imho, is easier to arrive at because we
# break down the problem into two parts: checking if a number
# is a featured number and incrementing our number by 14
# until we get the next featured number.
def featured_num?(num)
  num % 7 == 0 && num.odd? && num.digits.uniq == num.digits
end

def featured(number)
  if number >= UPPER_LIMIT
    return 'There is no possible number that fulfills those requirements.'
  end

  num = number + 1
  num += 1 until num.odd? && num % 7 == 0

  num += 14 until featured_num?(num)
  num
end

# More concise solution:
# This solution takes advantage of the fact the built-in
# digits method and modifiers (`until`) to cut down on the number of lines needed.
def featured(number)
  if number >= UPPER_LIMIT
    return 'There is no possible number that fulfills those requirements.'
  end

  num = number + 1
  num += 1 until num.odd? && num % 7 == 0

  num += 14 until num.digits == num.digits.uniq
  num
end

# Both solutions make use of guard clauses, which are
# early-return statements used to avoid unnecessary
# processing when we know a given input would be invalid.

# I came up with the upper limit by determining the max
# number that has unique digits, 9_876_543_210, and
# decrementing the number until I found a featured_num.
# Thereafter, I knew that any number equal to or greater
# than this featured_num has no next featured number, and
# I can return early from the program.

p featured(12)
p featured(20)            #== 21
p featured(21)            #== 35
p featured(997)           #== 1029
p featured(1029)          #== 1043
p featured(999_999)       #== 1_023_547
p featured(999_999_987)   #== 1_023_456_987
p featured(9_999_999_999)
