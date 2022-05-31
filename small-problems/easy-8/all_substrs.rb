
# With index! Cr: Adam D. 
def leading_substrings(string)
  string.chars.map.with_index { |_, i|string[0..i] }
end 

def substrings(str) 
  substrings_arr = []
  for i in (0...str.chars.size) do
    substrings_arr << leading_substrings(str[i..])
  end 
  substrings_arr.flatten
end 

# The Dresher**2 Strategy 
def substrings(str) 
  str.chars.map.with_index { |_, i| leading_substrings(str[i..])}.flatten 
end 

p substrings('abcde') ==
[
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]