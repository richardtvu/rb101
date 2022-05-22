=begin
ASCII String Value
https://launchschool.com/exercises/ae82edb6

- Input: String
- Output: Number
- Requirements:
  - The return value is the sum of all the ASCII values for the characters in the string.
  - Implicit:
    - If given an empty string, return 0.

Array for iteration.
Return 0 if there are no characters.
Iterate over the characters in string:
- Add the current ASCII value to the sum.
Return the sum.
=end

def ascii_value(str)
  str.empty? ? 0 : str.chars.map(&:ord).sum
end

# Further Exploration 
char.ord.chr == char 

p ascii_value('Four score')    == 984
p ascii_value('Launch School') == 1251
p ascii_value('a')             == 97
p ascii_value('')              == 0
