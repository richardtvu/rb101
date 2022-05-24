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

# Dr. Kaneyasu's Solution
def word_sizes(str) 
  str.split.each_with_object(Hash.new(0)) { |word, hsh| hsh[word.count "A-z"] +=1 } 
end 

# Commentary: 
=begin 
The `\W` used in the gsub method will filter out non-word characters. However, numbers and underscores are counted as word characters. The initial solution would fail with the edge case of '123abc'. 

The `count` method will return the number of characters of the word that are in the range "A..z". This range includes non-letter characters, such as `[`, `\\`, `^`, etc.  Thus, you'd probably want to use count "a-zA-Z" if you only wanted alphabetical characters. 
=end 

# Annotated Dr. K's solution 
def word_sizes(str) 
  str       # Split the string into words. 
  .split    # Invoke `each...` and pass in 
            # a new Hash with default of 0. 
  .each_with_object(Hash.new(0)) do 
    |word, hsh| 
    # 
    hsh[word.count "A-z"] +=1 
  end 
end 








p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}
