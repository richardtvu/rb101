=begin
Cute Angles 

- Input: Float (representing angle btwn 0-360)
- Output: String (angle as degrees, mins, secs)
- Requirements:
  - Degrees: °  / 60 mins
  - Minutes: '  / 60 seconds
  - Seconds: "
  - Use two digit #s with leading zeros for formatting minutes and seconds. 
  - No leading 0s for the degrees. 

Examples: 
# Because we're multiplying by 60 to get minutes. 
# 76.73 => 73 degrees, with 0.73 degrees remaining. 
# Convert the 0.73 degrees * 60 to get 43.8 minutes. 
# Then, 43 minutes, 0.8 minutes. 
# Multiply 0.8 mins by 60 to get 48 seconds. 
# Thus, we have 73 degrees, 43 minutes, 48 seconds.

Data Structures/Algorithms: 
- Variables 

Degrees is the whole part of the input (e.g. 76.73 is 76 degrees and mins,sec, etc)
Get the minutes by converting the remainder of degrees (e.g. 0.73 * 60 => 43.8 ). 
Get the seconds by cconverting the remainder of minutes (e.g. 0.8 * 60 => 48)
Return the string. 




=end 

DEGREE = "\xC2\xB0"

def dms(angle) 
  degrees = angle.floor 
  degrees_remainder = angle - angle.floor 
  minutes_overall   = (degrees_remainder * 60)
  minutes           = minutes_overall.round
  minutes_remainder = minutes_overall - minutes_overall.round
  seconds_overall   = minutes_remainder * 60 
  seconds           = seconds_overall.round


  minutes = sprintf('%02d', minutes)
  seconds = sprintf('%02d', seconds)
  "#{degrees}#{DEGREE}#{minutes}'#{seconds}\""

end 


