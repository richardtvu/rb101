# Advanced PEDAC Study Session! 

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