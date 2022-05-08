# PEDAC Practice Lesson 4.4



```rb
# Algorithm:
#  - initialize a result variable to an empty array
#  - create an array named substring_arr that contains all of the
#    substrings of the input string that are at least 2 characters long.
#  - loop through the words in the substring_arr array.
#  - if the word is a palindrome, append it to the result
#    array
#  - return the result array
```

```rb
def palindrome_substrings(str)
  result = []
  substring_arr = substrings(str) 
  substring_arr.each do |substring| 
    result << substring if is_palindrome?(substring) 
  end 
  result 
end 
```

Why do we get all the substrings at least two characters in length? 
- The test cases didn't count single letters as palindromes, so implicitly, we look for 2+ char substrings. 

How do we get all substrings for a string? 

e.g. "Hope" 
['Ho', 'Hop', 'Hope', 'op', 'ope', 'pe']
e.g. "Halo" 
['Ha', 'Hal', 'Halo', 'al', 'alo', 'lo']

```rb
# for each starting index from 0 through the next to last index position
  # for each substring length from 2 until there are no substrings of that length
    # extract the substring of the indicated length starting at the indicate index position
  # end of inner loop
# end of outer loop.
```

```rb
def substring(substr)
  substrings_arr = [] 
  (0..substr.length-2).each do |index| 
    substr = substr[index]
    (index..substr.length-index).each do |subsequent_index|
      substr += substr[subsequent_index]
      substrings_arr << substr if substr.size >= 2
    end 
  end 
  substrings_arr
end 

```rb
# START
#
#   /* Given a string named `string` */
#
#   SET result = []
#   SET starting_index = 0
#
#   WHILE starting_index <= length of string - 2
#     SET num_chars = 2
#     WHILE num_chars <= length of string - starting_index
#       SET substring = num_chars characters from string starting at index starting_index
#       append substring to result array
#       SET num_chars = num_chars + 1
#
#     SET starting_index = starting_index + 1
#
#   RETURN result
#
# END
```

```rb
def substring(substr)
  result = []
  starting_index = 0
  while (starting_index <= substr.length - 2)
    num_chars = 2
    while (num_chars <= substr.length - starting_index)
      substring = substr[starting_index, num_chars]
      result << substring 
      num_chars += 1
    end 
    starting_index += 1
  end 
  result
end 

def is_palindrome?(str) 
  str == str.reverse
end
```

```rb
# input: a string
# output: an array of substrings
# rules: palindrome words should be case sensitive, meaning "abBA"
#        is not a palindrome

# Algorithm:
#  substrings method
#  =================
#    - create an empty array called `result` that will contain all required substrings
#    - create a `starting_index` variable (value `0`) for the starting index of a substring
#    - start a loop that iterates over `starting_index` from `0` to the length of the string minus 2
#      - create a `num_chars` variable (value `2`) for the length of a substring
#      - start an inner loop that iterates over `num_chars` from `2` to `string.length - starting_index`
#        - extract a substring of length `num_chars` from `string` starting at `starting_index`
#        - append the extracted substring to the `result` array
#        - increment the `num_chars` variable by `1`
#      - end the inner loop
#      - increment the `starting_index` variable by `1`
#    - end the outer loop
#    - return the `result` array

#  is_palindrome? method
#  =====================
# - Inside the `is_palindrome?` method, check whether the string
#   value is equal to its reversed value. You can use the
#   String#reverse method.

#  palindrome_substrings method
#  ============================
#  - initialize a result variable to an empty array
#  - create an array named substring_arr that contains all of the
#    substrings of the input string that are at least 2 characters long.
#  - loop through the words in the substring_arr array.
#  - if the word is a palindrome, append it to the result
#    array
#  - return the result array
``` 

Test while writing code early and often. 