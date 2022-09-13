=begin
Write a method that takes a sentence string as input, and returns the same string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

I: String
O: String (with word_nums converted into digit strings)
R:
- Spaces between words are preserved.
- The numbers will be between 0-9.
DS: Hash

Algorithm:
- Create a hash of words to digit.
- Iterate over the words in the string.
  - Transform the word into a digit if the word is in the words_num hash.
- Return the string.
=end

WORDS = %w(zero one two three four five six seven eight nine)
DIGITS = (0..9).to_a
WORDS_TO_DIGITS = WORDS.zip(DIGITS).to_h

# If the word includes a digit word, then transform that part of the word into a digit.

def contains_digit_word(word)
  WORDS.each do |valid_word|
    return true if word.include?(valid_word)
  end
  false
end



def transform_word_digit(word)






end

p transform_word_digit("four.")

def word_to_digit(str)
  words = str.split.map do |word|
    if WORDS_TO_DIGITS[word]
      WORDS_TO_DIGITS[word]
    else
      word
    end
  end

  words.join(" ")
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') # == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

