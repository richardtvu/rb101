=begin
Swap Case

Write a method that takes a string as an argument and returns a new string in
which every uppercase letter is replaced by its lowercase version, and every
lowercase letter by its uppercase version. All other characters should be
unchanged.

You may not use String#swapcase; write your own version of this method.

- Input: String
- Output: String
- Requirements:
  - Make uppercase letters lowercase and lowercase letters uppercase.
  - Don't change any other characters.
  - Do not use #swapcase.

DS:
- Array

Algos:
Iterate over the given string, str.
Uppercase lowercase letters and lowercase uppercase letters.
Return a new str.

Lo-lvl algo for how to determine upper/lowcase letters?
- Regex -> If the character is a match for the range a-z, lowercase,
  and A-Z, uppercase.
- Array for lowercase and uppercase letters.

Split the string into words.
Iterate over the words:
  Split the words into characters.
  Swapcase the characters.
  Join the characters together into a swap_cased word.
  Transform the words using the swap_cased word.
Join the words back together and return.

=end

# Initial Solution
def lowercase?(char)
  char.match(/[a-z]/)
end

def uppercase?(char)
  char.match(/[A-Z]/)
end

def swapcase_word(word)
  swapcased_word = word.chars.map do |char|
    if    lowercase?(char) then char.upcase
    elsif uppercase?(char) then char.downcase
    else
      char end
  end
  swapcased_word.join
end

def swapcase(str)
  words = str.split(' ')
  words.map { |word| swapcase_word(word) }.join(' ')
end

# Revised Solution

def swapcase(str)
  characters = str.chars.map do |char|
    if    lowercase?(char) then char.upcase
    elsif uppercase?(char) then char.downcase
    else
      char end
  end
  characters.join
end

p swapcase('CamelCase')         == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
