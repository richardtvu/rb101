=begin 

Write a method that takes one argument, a string containing one or more words, and returns the given string with words that contain five or more characters reversed. Each string will consist of only letters and spaces. 

Spaces should be included only when more than one word is present.

# Problem 
- Input: string (1+ words) 
- Output: string (words with 5+ are reversed) 
- Requirement: 
  - The method will be called `reverse_words` 
  - Any word with 5+ characters will be reversed. 
- Implicit Requirement: 
  - Words with <5 characters will NOT be reversed. 
  - Questions: 
    - "Word   booper" => "Word   repoob"? OR "Word repoob"?  ===> No preservation of space (interviewer)


# Example 

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

# Data Structure 

- Array to hold the separate words. 


# Algorithms 

# START 
# GIVEN a string containing 1+ words 

# SET words = [] 
# SET words = string.split
# SET reversed_words = [] 
# Iterate over the words in words: 
  # IF the word has 5+ characters:
    # SET reversed_words - add the reversed word 
  # ELSE 
    # SET reversed_words - add word 

# Combine the reversed words back into a string with a space between the words. 

END 

# END 



=end 

# Code (with intent) 

# GIVEN a string containing 1+ words 

# SET words = [] 
# SET words = string.split
# SET reversed_words = [] 
# Iterate over the words in words: 
  # IF the word has 5+ characters:
    # SET reversed_words - add the reversed word 
  # ELSE 
    # SET reversed_words - add word 

# Combine the reversed words back into a string with a space between the words. 

def reverse_words(string) 
  words = []
  words = string.split 
  reversed_words = []
  words.each do |word| 
    if word.size >= 5
      reversed_words << word.split("").reverse.join
    else 
      reversed_words << word
    end 
  end 

  reversed_words.join(" ")
end 


puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS


# Tips


# Output
# Return 
# Mutation - return the original object, but changed. 

# Use precise language (e.g. return value) + results 
# Keep the code separate from the algorithm (clean) 
# Verbalize the expected return value of each step in a chained method. 
# Test testcases one at a time for psychological reasons, managing anxiety. 


