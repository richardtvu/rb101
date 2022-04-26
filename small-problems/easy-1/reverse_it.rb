=begin 
Reverse It - Part 1

Problem: 
- Input: String (made up of words or nothing?)
- Output: String with words reversed
- Requirements/Rules: 
  - Words will remain in the order they came, but the order will be reversed. 
  - Implicit requirements: 
    - Spaces are not preserved when there are no words. 
    - Case must be preserved. 
    - An empty string will be equal to an empty string. 

- Clarifying questions: 
  - Can there be more than one adjacent space separating words? If so, are these spaces to be preserved or replaced with a single space? 
    - Let's say that there will only be _one_ space between words. 

Examples: 

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''

Data Structures: 
- Something to hold the different words (strings), that is easily reversible, and ordered --> An array!
- Alternative? A hash? 


Algorithm: 

# START
# GIVEN a string 
# SET words = [] 
# SET words = string.split(" ") # Splitting on the space. 
# SET words = words.reverse.join(" ") # Reverse the array of words and then join the words into a string with a space between each word.  

# END

=end 
# Code (with intent): 

def reverse_sentence(string) 
  string.split.reverse.join(" ") 
end 

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''