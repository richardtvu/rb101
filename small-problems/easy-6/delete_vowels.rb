=begin
https://launchschool.com/exercises/8fa5da79

- Input: Array of Strings 
- Output: Array of Strings (but without vowels) 
- Requirements: 
  - Remove the chars a, e, i, o, u
  - Implicit requirements: 
    - If there are no more characters in string after removing vowels, return an empty string in place of the string. 

Data Structure? 
- Array, to keep track of each word. 

Algo? 

Iterate through each string.
- Remove the vowels in the string. 
- Add the string to a new array. 
Return the new array 

# This fails the third test case. 
Combine all the strings.
Use regex to delete vowels. 
Split the string up. 
Return the array of strings. 
=end 

def remove_vowels(strings)
  strings.each_with_object([]) do |str, devoweled_strs|
    devoweled_strs << str.delete('aeiouAEIOU')
  end  
end 

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white))   == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ))              == ['BC', '', 'XYZ']

# p remove_vowels([''])