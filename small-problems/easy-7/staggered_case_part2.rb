=begin
Staggered Caps (Part 2)

Input: String
Output: String
- Requirements:
  - Alternate upper/lowercasing letters.
  - Ignore non-alphabetical characters when determining when to alternate upper/lowercasing.

Iterate over the string,
- Determine if the character is a letter.
- Upper/lowcase letter as appropriate.
- Flip the boolean for detemining upper/lowercase.
- Return the mapped string.

=end

def letter?(char)
  char.match(/[a-z]/i)
end

def upper_lower(char, uppercase)
  uppercase ? char.upcase : char.downcase
end

def staggered_case_all_chars(str, first_letter_upper = true)
  uppercase = first_letter_upper ? false : true
  characters = str.chars.map do |char|
    (uppercase = !uppercase) ? char.upcase : char.downcase
  end
  characters.join
end

def staggered_case_only_letters(str, first_letter_upper = true)
  uppercase = first_letter_upper ? false : true
  characters = str.chars.map do |char|
    if letter?(char)
      uppercase = !uppercase
      upper_lower(char, uppercase)
    else
      char
    end
  end
  characters.join
end

def staggered_case(str, first_letter_upper = true, only_count_letters = true)
  unless only_count_letters
    return staggered_case_all_chars(str,
                                    first_letter_upper)
  end

  staggered_case_only_letters(str, first_letter_upper)
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
