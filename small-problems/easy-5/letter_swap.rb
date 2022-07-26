# Letter Swap
=begin
- Input: String (words delimited by space)
- Output: String
- Requirements:
  - Swap first and last letters of each word in string.
  - Input will only contain words & spaces.
  - Each word has at least one letter.
  - Each string has at least one word.

Examples:
- 'a' => 'a'
- 'abc' => 'cba'
- 'hellO World' => 'Oellh dorlW'

Data Structure?
- Intermediate: Array to keep track of different words.

Algo:
Get each word in the string.
Swap the first and last letter of each word.
Return all the words.

=end

def swap_first_last_chars(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

def swap(str)
  words = str.split.map do |word|
    swap_first_last_chars(word)
  end
  words.join(' ')
end

p swap('Oh what a wonderful day it is') #== 'hO thaw a londerfuw yad ti si'

p swap('Abcde') # == 'ebcdA'
# p swap('a') #== 'a'
