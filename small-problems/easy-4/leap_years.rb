=begin
# Feedback

- Spend more time on the problem understanding phase: 
  - You mixed up the Julian Calendar with the Gregorian calendar. 
  - Next time verify the definitions of the terms with the interviewer.
    e.g. "The Julian calendar is any year before 1752 or after? Just to clarify I'm reading the problem correctly."



----

A continuation of the previous exercise.

The British Empire adopted the Gregorian Calendar in 1752, which was a leap year. Prior to 1752, the Julian Calendar was used. Under the Julian Calendar, leap years occur in any year that is evenly divisible by 4.

Using this information, update the method from the previous exercise to determine leap years both before and after 1752.

P: 
- Input: integer 
- Output: boolean 
- Requirement:
  - True if leap year, else false. 
  - Use the old rules for leap years when the year is earlier than 1752
  - When the year is 1752 or later, then I just return true if I can by divide by 4
  - Minimum Year: 0
  - 0 is not leap year. 
Examples: 

leap_year?(1752) == true 
leap_year?(1750) == false 
leap_year?(0) == false 
leap_year(2000) == true  
leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == true
leap_year?(1) == false
leap_year?(100) == true
leap_year?(400) == true

Data/Algo: 
- Intermediate: Integer
- Output: Boolean 


High-level:
Make sure year is not 0. 
Return based on the old leap year criteria for years before 1752. 
Return based on the new leap criteria for years on or after 1752. 

Low-level 
GIVEN a integer 
IF the integer is 0, return false. 
IF the integer is between 1 and 1751
  Return the value of the call to the the old leap year function 
ELSE 
  Return the result of getting the remainder of dividing the year by 4. 

=end

def old_leap_year?(year)
  return false if year < 4
    if year % 4 == 0
      if year % 100 == 0
        return false unless year % 400 == 0
      end
      return true
    end
    return false
  end


def leap_year?(year) 
  return false if year == 0
  if !year.between?(1, 1751) # For Julian calendar. 
    return old_leap_year?(year)
  else  
     return year % 4 == 0  
  end 
end 

p leap_year?(2015)   == false
p leap_year?(240001) == false
p leap_year?(1)     == false
p leap_year?(2016) == true
p leap_year?(2100) == false
# p leap_year?(2400) == true
# p leap_year?(240000) == true
# p leap_year?(2000) == true
# p leap_year?(1900) == false
# p leap_year?(1752) == true
# p leap_year?(1700) == false
# p leap_year?(100) == false
# p leap_year?(400) == true  

