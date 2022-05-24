=begin
Letter Counter (Part 2)
https://launchschool.com/exercises/16124e4d

- Input: string
- Output: string
- Requirement:
  - Remove all non-letter words.

My assumption for simplicity: letters include a-z, A-Z, an underscore, or number.

=end

# Initial Solution
def normalized_word_size(word)
  word.gsub(/\W/, '').size
end

def word_sizes(str)
  str.split.map { |word| normalized_word_size(word) }.tally
end

# Revised solution based on LS Solution

def word_sizes(str)
  str.split.map { |word| word.delete('^A-Za-z').size }.tally
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}
