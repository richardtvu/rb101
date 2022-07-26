=begin
Century:
https://launchschool.com/exercises/d6a8f167

# Problem
- Input: Integer (year)
- Output: String (century)
- Requirement:
  - Return string beginning with century number and suffix:
    - `st`, `nd`, `rd`, `th`
  - New centuries begin with years ending with `01`.

- Questions:
    - Is year 0 the 0th century?

- Implicit requirements:
    - Years ending with:
      - 00 - "th"
      - 01 - "st"
      - 02 - "nd"
      - 03 - "rd"
      - 04 - "th"
      - 05 - "th"
      ...
      - 19 - "th"
      - 20 - "th"
      - 21 - "st"
      - 22 - "nd"
      - 23 - "rd"
      - 24 - "th"
      - ...
      - 29 - "th"
      - 30 - "th"
      ...

# Examples

century(2000) == '20th'
century(2001) == '21st'
century(1965) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'

# Data Structure
- Intermediate? Maybe an array to keep track of digits.

# Algorithm
Given a year (integer)
Hi-level algo(s):

Get the century number.
Get the century suffix.
Return the century number + century suffix.

Lo-level algo(s)
A new century begins with years ending with 01.

Given a year (integer)
Get the century number?
- Divide the year by a century (100) to get the century if there is no remainder.
- If there is a remainder, then we're in the next century, so add 1 to the century number.
- Return the century number.

Get the century suffix?
Get the last two digits of the year.
If the 2nd to last digit is a 1, then:
  the suffix is "th"
Else check the last digit to get the suffix
    If the last digit is 0 or 4-9,
      the suffix is "th"
    Otherwise if the last digit is 1
      "st"
    Otherwise if 2
      "nd"
    Otherwise if 3
      "rd"
End

# ----------------- Code ------------------
=end

def get_century_num(year)
  century_num, remainder = year.divmod(100)
  century_num += 1 unless remainder == 0
  century_num
end

def get_century_suffix(century_num)
  digits = century_num.digits.reverse
  if digits[-2] == 1
    'th'
  elsif digits.last == 1
    'st'
  elsif digits.last == 2
    'nd'
  elsif digits.last == 3
    'rd'
  else
    'th'
  end
end

def century(year)
  century_num = get_century_num(year)
  century_suffix = get_century_suffix(century_num)
  century_num.to_s + century_suffix
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10_103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11_201) == '113th'
