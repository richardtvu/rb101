=begin
Further Exploration of The End is Near ...
https://launchschool.com/exercises/8332cd47

- Input: String
- Output: String
- Requirements:
  - Get the middle word of a sentence.
  - Words are sequences of non-blank characters.
- Edge cases?
  - Empty strings => Return empty string.
  - Strings with even # of words (i.e. no middle). => Return the first word of the two
  - String with one word. => Return string

=end

# Further Exploration
def middle_word(sentence)
  return sentence if sentence.size < 2

  words = sentence.split(' ') # [middle]
  middle = words.size.even? ? (words.size / 2) - 1 : words.size / 2
  words[middle]
end

p middle_word('Hello World') # => "Hello"
p middle_word('')
p middle_word('Sup')
p middle_word('No way Jose')
p middle_word('Ya tu sabes guey')
