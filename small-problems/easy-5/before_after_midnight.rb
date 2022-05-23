=begin
After Midnight (Part 2)
https://launchschool.com/exercises/34f92353

Input: String (HH:MM, 24 hr time)
Output: Integer (mins before and after midnight)
- Requirements:
  - The return value shall be between 0 and 1439.
  - No date method.
  - Make 2 methods:
    - Before midnight mins
    - After midnight mins

Examples:
- '00:00' => 0
- '23:59' => 1439
- '12:01' => 721
- '00:59' => 59

Data Structure:
- Intermediate? Array... to convert str to digits.

Algorithm:
For after minutes...
Given a string containing time in 24h format.
Convert the string into hours and minutes respectively.
Convert the hours into minutes and add to minutes.
Normalize the minutes into a range between 0..1439.
Return of the sum of the minutes.

For before minutes:
Do the same as above.
Return the difference between minutes in day and the return of after minutes.

Convert the string into hours and minutes respectively?
  - Split the string into hours and minutes.
  - Convert the hours_str and mins_str into integers.
  - Convert the hours_integer into minutes and add to the minutes_str.
=end

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY

def normalize_mins_in_0_to_1439(mins)
  mins % MINUTES_PER_DAY
end

def after_midnight(time)
  hours, mins = time.split(":").map(&:to_i)
  hours *= MINUTES_PER_HOUR
  normalize_mins_in_0_to_1439(hours + mins)
end

def before_midnight(time)
  mins = (MINUTES_PER_DAY - after_midnight(time))
  normalize_mins_in_0_to_1439(mins)
end

p after_midnight('00:00')   == 0
p before_midnight('00:00')  == 0
p after_midnight('12:34')   == 754
p before_midnight('12:34')  == 686
p after_midnight('24:00')   == 0
p before_midnight('24:00')  == 0
