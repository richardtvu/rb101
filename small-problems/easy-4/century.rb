# Century 
=begin 
Write a method that takes a year as input and returns the century. 
The return value should be a string that begins with the century number, 
and ends with st, nd, rd, or th as appropriate for that number.

New centuries begin in years that end with 01. 
So, the years 1901-2000 comprise the 20th century.

Problem: 
- Input: Year (integer?)
- Output: String (Century)
- Requirement: 
  - Century numbers must have a suffix, e.g. 1st, 4th, 9th, 13th. 
  - Centuries span from X01 to (X+1)00, e.g.:
    - 0 is the 0th century. 
    - 1-100 is the 1st century
    - 101-200 is the 2nd century. 
    - 1101-1200 is the 12th century. 
    - 1201-1300 is the 13th century. 
- Implicit Requirements: 
  - 0 - th 
  - 1 - st
  - 2 - nd 
  - 3 - rd
  - 4
- Questions: 
  - When are the st, nd, rd, or th appropriate for a number? 
  - Can there be any non-numeric or fractional inputs?, 
    - e.g. Two thousand one or 2))1 or 200.1? 
    - If so, how would I deal with those inputs? 
  - What's the minimum year? e.g. 0, -2123213? 

Examples: 
century(0) == "0th" #century 
century(1) == "1st"
century(100) == "1st"
century(101) == "2nd" 
century(1001) == "11th"
century(1300) == "13th"
century(15) ==  

=end

def century(year) 

end 