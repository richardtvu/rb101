=begin
Leap Years
https://launchschool.com/exercises/f44b8f8b

# Problem

- Input: Integer (>0)
- Output: Boolean (true if leap, else false)
- Requirements:
  - Gregorian = 1752 and onward
    - Leap years are divisible by 400 OR
    divisible by 4 and not 100.
  - Julian = 0-1751
    - Leap years are divisible by 4.

- Questions:
  - Max year? Infinity.
  - Input data type? Integers or are floats acceptable too?
    - Integers only.

# Data Structure
- Intermediate? None

# Algorithm

If year is gregorian, then calculate leap year using gregorian rules.
Otherwise, calculate using Julian rules.
Return result.
# -------------------------------------- Code -------------------------------

=end

GREGORIAN_ADOPTION_YEAR = 1752

def is_gregorian_year?(year)
  year >= GREGORIAN_ADOPTION_YEAR
end

def gregorian_leap_year?(year)
  return true if year % 400 == 0
  return true if year % 4 == 0 && year % 100 != 0

  false
end

def julian_leap_year?(year)
  year % 4 == 0
end

def leap_year?(year)
  return gregorian_leap_year?(year) if is_gregorian_year?(year)

  julian_leap_year?(year)
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240_000) == true
p leap_year?(240_001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true
