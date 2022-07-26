=begin
Staggered Caps (Part 1)

Input: String
Output: String
- Requirements:
  - Output string has every other character capitalized, with
  remaining characters lowercased.
  - Non-letter characters will be the same in the output, but count
  as characters when switching from upper and lowercase.

Data Structure:
- Array

Algos:
- Keep track of upper/lowercase turn.
- Iterate through the string.
  - When uppercase turn, capitalize the letter.
  - Else downcase the letter.
- Return the transformed string.
=end

# Initial Solution
def staggered_case(str)
  uppercase = true
  characters = str.chars.map do |char|
    if uppercase
      uppercase = false
      char.upcase
    else
      uppercase = true
      char.downcase
    end
  end
  characters.join
end

# Refactored solution
def staggered_case(str)
  uppercase = false # Set to true to have 1st letter be lowercase.
  characters = str.chars.map do |char|
    (uppercase = !uppercase) ? char.upcase : char.downcase
  end
  characters.join
end

# Further Exploration
def staggered_case(str, first_letter_case = :upper)
  uppercase = !(first_letter_case == :upper)
  characters = str.chars.map do |char|
    (uppercase = !uppercase) ? char.upcase : char.downcase
  end
  characters.join
end

p staggered_case('I Love Launch School!') #== 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
