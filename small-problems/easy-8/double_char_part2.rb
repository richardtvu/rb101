=begin
Double Char (Part 2)
- Input: String
- Output: String
- Requirements:
  - Only double consonants.
  - Leave alone vowels, digits, punctuation, whitespace, basically anything else.

Create a list of consonants
Iterate over the given str.
- Repeat any consonants.

Return the str.

=end

VOWELS = ['a', 'e', 'i', 'o', 'u']
CONSONANTS = ('a'..'z').to_a.delete_if { |char| VOWELS.include?(char) }

def consonant?(char)
  CONSONANTS.include?(char.downcase) 
end 

def double_consonants(str)
  str.chars.map { |ch| consonant?(ch) ? ch * 2 : ch}.join
end

p double_consonants('String') #== "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
