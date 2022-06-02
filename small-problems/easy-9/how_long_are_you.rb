=begin 
Input: String 
Output: Array 
- THe output array has every word in the string. 
- Each word has a space and the length of the word appended. 
- All words are separated by one space.
- Any sequencce of non-space chars are words. 

Data Structure?
- Array? 

Algo: 
- Split the string into words.
- Transform each word into the word with a space and the size appended. 

=end 

def word_lengths(str) 
  str.split.map { |word| "#{word} #{word.size}" }
end 

p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]
p word_lengths("baseball hot dogs and apple pie") ==["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]
p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]
p word_lengths("Supercalifragilisticexpialidocious") == ["Supercalifragilisticexpialidocious 34"]
p word_lengths("") == []