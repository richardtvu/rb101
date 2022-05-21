# Convert String Analysis 

## Initial PEDAC 

Problem: 
- Input: String (of digits) 
- Output: Integer 
- Requirement 
  - Cannot use the to_i or Integer() constructor. 
  - Assume all characters are numeric. 
  - Don't worry about +/- signs. 
  - Analyze the characters in the string. 

Data Structure? 
- Hash: ('0' => 0, ... '9' => 9) Translate char to int 
- Array: To store the ints

Algorithm? 

Given a string, str of digits. 
Iterate over the characters in str. 
- Convert each character into a digit. 
Convert each digit into an integer that would represent the number the digit represents, given its place. 
  - e.g. 4321, 4 represents 4000 because it is in the thousand's place. 
Add each of the numbers together to get the number converted from a string. 

Would it just be possible to combine the elements of an array together...? without having to add? 
**look this up, arr methods later** 

Given a string, str of digits. 
Initialize a local variable `digits` to []. 
Iterate over the characters in str. 
- Convert each character into a digit. 
- Add this digit to `digits`. 

Iterate over digits. 
Convert each digit into an integer that would represent the number the digit represents, given its place. 
  - e.g. 4321, 4 represents 4000 because it is in the thousand's place. 

Sum the digits in digits. 
Return this sum. 

## Initial Solution 

```rb 
CHAR_DIGITS_HASH = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, 
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def char_to_digit(char) 
  CHAR_DIGITS_HASH[char]
end 

def transform_digits_numbers(digits) 
  multiplier = 1 
  index = -1 
  digits_translated = []
  while index.abs <= digits.size 
    digits_translated << digits[index] * multiplier
    multiplier *= 10 
    index -= 1
  end 
  digits_translated.reverse
end 


def string_to_integer(str) 
  digits = [] 
  str.chars.each do |char| 
    digit = char_to_digit(char) 
    digits << digit 
  end 
  
  digits = transform_digits_numbers(digits) 
  digits.sum 
end 

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
```

## Post-Problem Solving Questions 

### LS Analysis 

1. What does LS's solution do differently than mine? 

2. Why do I think LS did it the way he did? 

3. Does my program miss some of the "edge cases"?

### Comparison with Other Students' Solution 

1. Were there any solutions that interested me? Why? 

2. How can I use their solutions to improve my code? 

3. What do I want to follow up on? 

