=begin 
Write a method that takes a string, and returns a new string in which every character is doubled.

Input - String 
Output - String 
- Every char is doubled in the output string. 

Iterate over the input string. 
Add 2 of each character to a new strnig. 

=end 

def repeater(str)
  str.chars.map { |char| char * 2 }.join  
end 

p repeater("hi")
p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''