=begin 
Input: String 
Output: Boolean 
- Requirements: 
  - Returns true if all letters are uppercase. Else returns false. 
  - Ignores non-letters in calculations. 

Data Structure?
- Array. Or just a simple string. 

Algo:
- Delete all non-letters. 
- Compare the cleaned_up str with an uppercase version of the cleaned_up_str. 
  - Return true if the two strings are equal. 
  - Else return false. 

=end 

# Initial Solution 
def uppercase?(str) 
  cleaned_str = str.delete('^a-zA-Z')
  cleaned_str == cleaned_str.upcase
end 

# Revised solution 
def uppercase?(str) 
  str == str.uppercase
end 

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true
