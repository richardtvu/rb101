=begin

Capitalize Words 

Write a method that takes a single String argument and returns a new string that contains the original value of the argument with the first character of every word capitalized and all other letters lowercase.

You may assume that words are any sequence of non-blank characters.

Input: String 
Output: String 
- Requirements: 
  - First char of each word is capitalized. 
  - All other characters are lowercased. 
  - Non-letters are counted in first character judgment. 

Data Structure?
- Array 

Iterate through each word in string. 
- Capitalize the word while leaving the other characters in word lowercased. 

Examples

=end 

# Initial Solution 
def word_cap(string) 
  string.split.map {|word| word.capitalize }.join(' ') 
end 

# Refactored solution
def word_cap(string) 
  string.split.map(&:capitalize).join(' ') 
end 

# Further Exploration 
# Bethany P.
def word_cap(string) 
  capped_words = string.split.map! do |word|
    word[0].upcase + word[1..].downcase 
  end 
  capped_words.join(" ")
end 

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'