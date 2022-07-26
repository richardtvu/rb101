=begin
Word to Digit

Input: String
Output: String
Requirements:
- Return the string with numbers in word form replaced with their digit equivalent.
- e.g. 'five' would be '5'
- Implicit:
  - An empty str just returns an empty str.
- Question:
  - Same string as in return the same string object?
Data Structure?
- Array or String...
- Hash - for the translations from word to digit.

Algorithm:
- Iterate over the word_numbers (i.e. one, two, ... nine):
  - Replace any of occurrences of those word_numbers with their digit equivalent.

- Return the string.
=end

DIGITS = {
  'zero' => '0', 'one' => '1', 'two' => '2',
  'three' => '3', 'four' => '4', 'five' => '5',
  'six' => '6', 'seven' => '7', 'eight' => '8',
  'nine' => '9'
}.freeze

# Initial Solution - Fails edge case where a word has a substring that matches word, e.g. "freight"
def word_to_digit(string)
  DIGITS.each { |word, digit| string.gsub!(word, digit) }
  string
end

# Amaze-balls Elizabeth A.'s solution is so elegant :O!
def word_to_digit(string)
  string.gsub(/\w+/) { |word| DIGITS.fetch(word, word) }
end

p word_to_digit('Freight')

def word_to_digit(string)
  DIGITS.each { |word, digit| string.gsub!(/\b#{word}\b/, digit) }
  string
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
