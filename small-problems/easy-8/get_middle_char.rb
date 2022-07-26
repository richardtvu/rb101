=begin

Input - String (non-empty)
Output - String (middle char or middle 2 chars)
- Reqs:
  - If size of string is odd, return a single middle char
  - Else return the 2 middle chars.

Examples
- 'Launch' => 'un'
  - 6 chars, so return middle 2.
  - `u` is 3rd and `n` is 4th char, which are index 2 and 3 respectively.
- 'Ilove' => 'o'
  - 5 chars, so return middle 1.
  - 'o' is the 3rd char, which is index 2.

Data Structures?
- Array or not.

Algorithm:

Return the middle 2 characters if the length is even
Else return the middle 1 character if length is odd.

=end

# Initial Solution
def center_of(str)
  mid = str.size / 2
  str.size.odd? ? str[mid] : str[mid - 1, 2]
end

# Modified based on Adam D.'s solution. I like the clarity of `mid-1 .. mid`, which means "Get the character to the left of the middle and the middle character."
def center_of(str)
  mid = str.size / 2
  str.size.odd? ? str[mid] : str[mid - 1..mid]
end

p center_of('I love ruby') #== 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
