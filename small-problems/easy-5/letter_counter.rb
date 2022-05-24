=begin
Letter Counter (Part 1)
https://launchschool.com/exercises/e66bd409

- Inputs: String (space delimited words)
- Output: Hash (# of words of different sizes)
- Requirements:
  - Word = any string of characters that don't incldue spce.
- Implicit Requirement:
  - Treat non-letter characters as part of a word, e.g. "What's" is a 6-letter word.
  - When given an empty string, return an empty hash.
  - Order of keys doesn't matter.
- Questions:
  - What's the minimum length for a word? 1 character?

Data Structure:
- Intermediate: Array (words in the string)
- Output: Hash

Algorithm:
Get each word.
Iterate through each word:
- Count the number of characters in each word.
- Add the number of characters and add or increment frequency of character count to a hash.
Return the hash

Code
=end

# Initial Solution
def word_sizes(string)
  string.split.each_with_object(Hash.new(0)) do |word, size_freq|
    size_freq[word.size] +=1
  end
end

# One-liner. 
def word_sizes(wrds)
  wrds.split.each_with_object(Hash.new(0)) { |wrd, cnts| cnts[wrd.size] += 1 }
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}

# Postscript
=begin 

I felt intrigued by Dr. Kaneyasu's solution, so I decided to break it down. 

def word_sizes(str) 
  str
  .split      # Split the string into different words, e.g. ["What's", "up", "doc?"]
  .map(       # Invoke the map method on the str_arr above 
    &:size    # to transform each element (a word) into its size
  )           # Return a new array containing the sizes of the words
  .tally      # Return a hash that contains the sizes and the # of times the sizes show up
end 

We `split` method is invoked on the string referenced by `str`, which returns an array of words. We invoke the `map` method on this array with an argument of `&:size`. On each iteration of `map`, we invoke the `size` method on each element (a word string) in the array. `map` returns a new array containing the sizes of the words. We invoke `tally` on this array of word sizes and return a hash containing the sizes and counts of those sizes. 
=end 