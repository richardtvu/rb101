=begin 
CLean up the words!
https://launchschool.com/exercises/28ff0d86

- Input: String 
- Output: String 
- Requirements: 
  - Input string will have lowercase letters and non-alphabetic chars. 
  - Replace non-letters with spaces. 
  - Spaces must not be consecutive, only one -space between or after letters. 

Examples: 
- 'as983b' => 'as b' 

Data Structure: 
- Array to keep track of words. 

Algorithm: 
- Replace all non-letters with spaces. 
- Iterate through string to delete duplicate spaces. 
- Return string. 
=end 

def cleanup(string) 
  spaced_str = string.gsub(/[^a-z]{1,}/, ' ' )
end 

p cleanup("---what's my +*& line?") == ' what s my line '