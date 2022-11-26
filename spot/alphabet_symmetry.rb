=begin
Alphabet symmetry
Consider the word "abode". We can see that the letter `a` is in position 1 and `b` is in position 2.
In the alphabet, 'a' and 'b' are also in positions 1 and 2. Notice also that 'd' and 'e' in 'abode'
occupy the positions they would occupy in the alphabet, which are positions 4 and 5.

Given an array of words, return an array of the number of letters that occupy their positions in the
 alphabet for each word. For example, `solve(["abode","ABc","xyzD"])` => `[4, 3, 1]`.

Input will consist of alphabet characters, both uppercase and lowercase. No spaces.
----------
PEDAC
I - Array (of strings)
O - Array (of Integers)
R:
- Return the number of symmetric letters in each string.
- A letter is symmetric if the position it occupies within a string corresponds to the position the letter occupies in the alphabet, e.g. 'a' is position 1 in the alphabet and in this string 'alphabet'.
- The input strings will contain both lower and uppercase letters without any spaces or punctuation.
- Symmetry is case-insensitive.

Data Structure:
- Intermediate: Hash
- Array of Integers

Algorithm:
- Initialize a hash of the letters 'a' through 'z' with corresponding values being 1 through 26.
-
- Transform each string in the input array:
  - Downcase each string
  - Count the number of symmetric letters.
- Return the new array.

Iterate over the string:
  - Get the position of the character.
  - If the position of the character matches the letter position in the alphabet, increment count.
  - Otherwise, move on.
=end

LETTERS = 'a'..'z'
POSITIONS = 1..26
LETTER_POSITIONS = LETTERS.zip(POSITIONS).to_h

def num_symmetric_letters str
  str.each_char.with_index.count do |letter, idx|
    LETTER_POSITIONS[letter] == idx + 1
  end
end

def symmetric_letters_per_string strings
  symmetric_letters_per_string = strings.map { |str| num_symmetric_letters str.downcase }
  p symmetric_letters_per_string
end

alias solve symmetric_letters_per_string

p solve(["abode","ABc","xyzD"]) == [4,3,1]
p solve(["abide","ABc","xyz"]) == [4,3,0]
p solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"])== [6,5,7]
p solve(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]