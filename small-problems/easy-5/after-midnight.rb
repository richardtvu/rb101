=begin 
After Midnight Easy 5.2 
https://launchschool.com/exercises/864acdb4

- Input: Integer 
- Output: String (hh:mm) 
- Requirements: 
  - No Date or Time class use. 
  - Disregard time zone issues. 
  - Output string is made up of hours (HH) and minutes (MM). 
- Implicit Requirements: 
  - Hour = 60 mins 

Example: 
- 0 (midnight) ==> "00:00"
- 1439 => "23:59"
- -1439 => "00:01"
- 1440 => "00:00"


Data Structure: 
- Array [HH, MM] 
- Hash? { HH: V, MM: V}

Algorithm: 
There are 1440 minutes in the day.
Get the net positive minutes from midnight by dividing the given_minutes by 1440. 
Get the hours and minutes by invoking divmod on net_positive_mins. 

**Question**: How does Divmod work? 
**Question**: How does % work? 
=end 

MINS_IN_DAY  = 1440 
MINS_IN_HOUR = 60

# Why does this sprintf work this way? Precision?

def format_time(hours, mins) 
  sprintf("%.2d:%.2d", hours,mins)
end 

def time_of_day(given_minutes) 
  net_positive_mins = given_minutes % MINS_IN_DAY
  hours, mins = net_positive_mins.divmod(MINS_IN_HOUR)
  format_time(hours, mins)
end 


p time_of_day(0)      #== "00:00"
p time_of_day(-3)     #== "23:57"
p time_of_day(35)     #== "00:35"
p time_of_day(-1437)  #== "00:03"
p time_of_day(3000)   #== "02:00"
p time_of_day(800)    #== "13:20"
p time_of_day(-4231)  #== "01:29"