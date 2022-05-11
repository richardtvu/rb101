# Advanced PEDAC Study Session! 

## Why PEDAC? 

I have interviewed five software engineering candidates over the past two weeks, including folks with grad degrees in computer science/ex-FAANG with 7+ years of experience. All five were jointly rejected by myself and a co-interviewer either because the candidates jumped straight into implementation and ended up with bugs during testing or unhandled edge cases, and/or their oral-written communication was poor.

So, for those folks who are 'PEDACing' for the first few times:
1) Train your problem solving muscles to start with PEDAC by default (or some equivalent thereof);
2) Get comfortable talking through problems out loud, not just typing silently.

Can't stress enough that PEDAC isn't an arbitrary heuristic meant for getting through the curriculum or 109/129 oral assessments. PEDAC works, especially under pressure.

- Sam Swire (Check)

## High vs Low-Level

- High: Abstract, don't be super detailed. 
- Low: Avoid fuzziness.


## Common mistakes

- Not enough time spent parsing problems = Poor foundation for the rest of the steps.
  - In live interview setting or live assessment to simulate job asssessment, your brain will run so fast you might lose 30 iq points in that setting. 
  - Temptation to run through the steps.  
- Assumptions about the solution. 
  - "I've seen this type of question before!" ... and then solving the wrong problem.  
- No high-level algorithm. 
  - If you think you have a solution and start trying to do super detailed pseudocode, then you get locked into an approach even when it's a poor approach or unlikely to work. 
  - Write out how you want to approach the problem and come to a solution:
    - Fuzziness to clarify in low-level algorithm. 
  - **You can create more than one.**
    - e.g. iterate in one way, iterate in two ways. 
  - Why? 
    - If one high-level doesn't work out in the low-level, you can go try out another high-level approach.  
- Fuzzy low-level algorithms. 
- Lack of flexibility. 
  - Finding out that the coding implementation is missing details but failing to go back to algorithm to update it... Means less flexibliity. 
  - **Whenever you code/change the code differently, then go back to the algorithm to update algo.** 
- Lack of syntax fluency. 
  - Haven't solved enough problems/familiary with ruby syntax... So get tripped up when implementing. 


```rb
=begin
Common Mistakes
- Not enough time spent parsing the problem
- Assumptions about the solution
- No high-level algorithm
- Fuzzy low-level algorithm
- Lack of flexibility
- Lack of syntax fluency
=end
```

## Problem 

```rb 
=begin 
There are bunch of words and we need to check each word to see if it is the result of duplicating a portion of its letter.
``` 

```rb
=begin 
P/Write out problem in own words. 

Questions:
- What kind of data type will the input be? A list of strings representing words, a deliminited string? A list of characters that can be rearranged to form words? 
- What is a **word** in this context? 
  - THe least amount of chars to represent a word. 
- What do you want me to do when you get an empty or nil input? 
- What is a letter in this context? 
- What does it mean to duplicate a portion of its letter? 
- How do you want me to return the output? As a list of boolean values? 

Problems:
- Inputs: string 
- Outputs: array (of substrings) 
- Rules: 
  - Explicit Requirements: 
    - Iterate through each word. 
    -  Check if each word is the result of duplicating a portion of its letters. 
  - Implicit Requirements: 

Examples: 
duplicated_words("") == ? 
duplicated_words([])
duplicated_words(123)
duplicated_words(false)
duplicated_words(['abc'])
duplicated_words("hello world")
=end 

=begin
High-level Algorithm 

Initialize and assign a substr_arr to an empty array. 
Iterate through words. 
  Get letters that can be used to make the word. 
  Add those letters to an array. 
Return the array of letters. 

=end 

# ----

# PEDAC 
=begin
# Problem 

Questions:
- What kind of data type will the input be?
- Can other types of data be input? What do you want me to do in those cases? 
- What do you want me to do when you get an empty or nil input? 
- What are the key terms and what do they mean? 

Rules: 
- Input(s):   
- Output(s):
- Explicit Requirements: 
- Implcit Requirements: 

Examples 
=end 

```

# Alternate 
```rb
=begin
Check if a given string can be constructed by taking a substring of it and appending multiple copies of the substring together


This is too low-level. 
Get all the substrings that make up the string. 
Initialize and assign a substring variable to a substring. 
Iterate through the substrings:
  Starting with one copy of the substring. 
  If the substring matches the string, add the substring to an array.  
  Add another copy of the substring to the substring variable. 
  If the substring is larger in length than the given string, move on to the next substring. 
Return the array of substrings. 

While there are substrings: 
  Get a substring. 
  While the substring is shorter than or equal in length to the given string
    If the substring is equal to the string
      Add the substring to an array of substrings. 
Return the array of substrings. 

Alternative high-level algos: 


# high level algorithm
# find the substrings (length > 2) of each word
# check to see if that substring can be multiplied by length of the word / length of substring which would then result in the word
  # if so, then return something (TBD)

#Andrew
#algo: 
#idea 1: create a results hash. create an array of the string characters and iniitalize variable to the return value. create additional variable initialized to the return value of string.chars.uniq and then iterate over each character. upon each iteration count the number of characters for each character and store into hash. check to see if all the values in the hash are equal to each other and return true if so.(?)
#idea 2: create results array. iterate through each word. for each word, create an array of substrings, and iterate thru that collection and check to see if the original word can be formed. if possible, can store word into results array.


# # jacob:
# **algorithm**

# *high level:*
# - split the string into an array of characters
# - check every possible substring

# JD
# High-level:
# get count of all letters.
# create a hash with nested arrays of uniq letters in order of appearance in the string. hash keys will be integers from highest recurring letters to lowest, and values will be arrays with each character.


# 
# p repeated_substring_pattern("abab") == true
# p repeated_substring_pattern("aba") == false
# p repeated_substring_pattern("aabaaba") == false
# p repeated_substring_pattern("abaababaab") == true
# p repeated_substring_pattern("abcabcabcabc") == true
# Be flexible with your PEDAC. 

Given a string, return a boolean. 
PEDAC: 
input: string 
output: boolean (true/false) 

Get all the substrings in the string 
Iterate through each substring:
  While the substring is less than or equal to the 



Get all substrings
Iterate through substrings.
  Duplicate the substrings. 
  Return true if we find a match. 
Return false. 

Initialize and assign a substrings_arr variable to all of the substrings that make up the string. 
Iterate through the substrings_arr:
  Initialize and assign a substr variable to an empty string. 
  While the substr is less than the string in length:
    Add the current_substr to the substr variable. 
    Return true if the substr value matches the value of string 
Return false. 

# Does case matter? 

get_all_substrings(str)
'abc' 
'a', 'ab', 'abc' 
'b', 'bc', 
'c' 
Get the uniq substrings 

GIVEN a string 
Initialize and assign a substrings_arr to an empty array.
Initialize and assign a substr to an empty string. 
Start by getting the first letter of the string. 
  Add the letter the empty array. 
  Add the next letter of the string to the substr. 
  Add the substr to the array. 
  Repeat these last steps until there are no more letters to add to the substr. 
Move on to the 2nd/next letter of the string. 
Repeat the above until we've reached the end of the string. 
=end

def get_all_substr(str)
  substrings_arr = []
  substr = ""
  str.each do |letter|

  end 
end 


def repeated_substring_pattern(str)
  substrings_arr = get_all_substrings(str) 
  substrings_arr.each do | curr_substr |
    substr = "" 
    while substr.size < str.size 
      substr += curr_substr 
      return true if substr == str 
    end 
  end 
  false 
end 



```

# When you encounter some fuzziness in an algorithm, where you can't do 1:1 translation into code and go there to expand 

# Alternative ALgorithms 

```rb
# Advanced PEDAC Study Session!

# RV 
=begin 
high-level 
Get all substrings
Iterate through substrings.
  Duplicate the substrings. 
  Return true if we find a match. 
Return false. 

# Lower-ish level 
Initialize and assign a substrings_arr variable to all of the substrings that make up the string. 
Iterate through the substrings_arr:
  Initialize and assign a substr variable to an empty string. 
  While the substr is less than the string in length:
    Add the current_substr to the substr variable. 
    Return true if the substr value matches the value of string 
Return false.
=end 

=begin
JD

SET string length
return false if string length is odd number
SET empty array
set counter = 0
while counter <= stringlength/2
  append empty array with original_string[0..counter]
  add 1 to counter
end
For each element in appended array
  word = element
  while element length < original_string length
    add word to element
  end
  return array of transformed elements
IF any element in appended array is equal to the original string 
  return true
ELSE
return false
=end

# Liz
# low level algorithm
# find the substrings of the string (length > 2) 
  # initialize a variable substrings []
  # start_idx: iterate from index 0 through string length - 2
  # end_idx: iterate from start_idx through string length - 1
  # add substring of string[start_idx..end_idx] to substrings array
# iterate through each substring in the substrings array
  # multiplier = length of the word / length of the substring
  # check to see if that substring multiplied by the multiplier == original string
    # if true, then return true
  # if all substrings have been checked and nothing has been returned, then return false.
  
  #Andrew
  #low level algo: 
  #initialize substring array = []
  #iterate the strings into individual characters and create substrings

  #iterate through the array of substrings formed and multiply it by a multiplier
    #multiplier is calculated by the original string length divided by the length of the current substring that has a remainder value of 0
    #if multiplier is valid, then multiply the substring
  #compare the return value of sort method called on the (substring multiplied) to the sort method called on the original string.chars
  #if true, then return true, otherwise return false

```


# Spencer's Template

```rb

# Spencer's P(GR)U(MA)SC
=begin
# -------------------------------------- Problem ----------------------------
Goal


Rules



# -------------------------------------- Understand -------------------------
Model


Abstract
  

# -------------------------------------- Slice ------------------------------

  

# -------------------------------------- Code -------------------------------
=end

```


# PEDAC 

```rb
# Advanced PEDAC Study Session!

=begin
Common Mistakes
- Not enough time spent parsing the problem
- Assumptions about the solution
- No high-level algorithm
- Fuzzy low-level algorithm
- Lack of flexibility
- Lack of syntax fluency
=end

=begin
There are a bunch of words and we need to check each word to see if it is the result of duplicating a portion of its letters.

JD
iterate through an array of strings. With each string, check to see whether the current word has any repeating patterns of letters.
return array of booleans (OR MAYbe hash with associated words and boolean key)

Questions:
what is the least amount of letters that could qualify as forming a pattern to test against? 2?
can the word only be created by duplicating itself twice. cantcan or cancan

Test Cases and Examples
['talk', 'cantan', 'tonton', 'wonton', 'matilda', 'bootboot', 'atat', 'atbat']



RV: 
Questions:
- What kind of data type will the input be? A list of strings representing words, a deliminited string? A list of characters that can be rearranged to form words? 
- What is a **word** in this context? 
- What do you want me to do when you get an empty or nil input? 
- What is a letter in this context? 
- What does it mean to duplicate a portion of its letter? 
- How do you want me to return the output? As a list of boolean values? 

Problems:
- Inputs: words (list: array of characters? strings? or string?)
- Outputs: whether each word is result of duplicating a portion of its letter (boolean? list of booleans? strings? numbers? ) 
- Rules: 
  - Explicit Requirements:
    - Iterate through each word. 
    -  Check if each word is the result of duplicating a portion of its letters. 
  - Implicit Requirements: 

Examples: 
duplicated_words("") == ? 
duplicated_words([])
duplicated_words(123)
duplicated_words(false)
duplicated_words(['abc'])
duplicated_words("hello world")

Andrew:
#input: string object (or an array of words)
#output: string object (or an array of words)
#rules: Give an array of words, check each word to see if there are double characters of each character. return an array of words that qualify for this check
#questions: catcat is ok, but dogodog is not, correct? is catcatcat also ok? (is it double or triple, or more to be valid?)




  jacob:
  - there is a collection of words
  - each word will need to be checked
  - to see if it is the result of duplicating a portion of the word
  - if the word has the same letters repeated
  - -> 'bambam' is the result of 'bam' duplicated

  Liz:
  # problem:
# given a string that contains words, check to see if a given word can be 
# formed by duplicating letters from a substring of its letters

# input: string
# output: array of substrings?
```