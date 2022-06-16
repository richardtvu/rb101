=begin
Input: Integer
Output: Integer
Requirements:
- Return the number of Friday the 13ths in a year.
- Assume year will be greater than 1752
- Assume use of Gregorian Calendar

- How do I know when a Friday and the 13th coincide?

- How does the Gregorian calendar work?
- For every year, the day moves forward by 1, e.g. I think if my birthday i October 4 on a Friday, then next year it'll be on a Saturday...

There'll be a 7-day cycle.

How are many 13ths are there? 12 13ths in a year.
Maximum of 13... and

Septemeber 13, 2019
December 13, 2019

Fridays date decrements yearly, e.g. 13 --> 12, 11...

What is a leap year?

Date class.
Date Object
Friday?

Data Structure:
Date object
Array

Given the year, iterate through the months and initialize date objects for the 13th of each month.
Count the number of Fridays

=end
require 'date'

MONTHS = (1..12).to_a

def day?(date, desired_day)
  case (desired_day.downcase)
  when "sunday"     then date.sunday?
  when "monday"     then date.monday?
  when "tuesday"    then date.tuesday?
  when "wednesday"  then date.wednesday?
  when "thursday"   then date.thursday?
  when "friday"     then date.friday?
  when "saturday"   then date.saturday?
  end
end

def week_date_occurrences(year, day_of_week, day_of_month)
  dates = MONTHS.map do |month|
    Date.new(year, month, day_of_month)
  end
  
  dates.count { |date| day?(date, day_of_week) }
end

def friday_13th(year)
  week_date_occurrences(year, "friday", 13)
end

p friday_13th(2015) #== 3
p friday_13th(1986) #== 1
p friday_13th(2019) #== 2
