# PEDAC Tips 

## What are some useful questions to understand the problem?

General Questions for Explicit Requirements: 
- Will there be any inputs not shown in this question? 
  - e.g. a problem says "Given a string ...". 
    - "Will there be any non-string inputs? If so, how would you like me to handle those inputs?" 
- What does X term mean? e.g. Palindrome? Multiples? Factors? Memoization? 

General Questions for Implicit Requirements: 
- What do I do when given an input that is empty or nil? 
- Will I be mutating the object I'm given or returning a new object? 

Example Context-Specific Questions: 
- Suppose a problem says "Given a string, output whether the string is equal to 'David'." You could ask: 
  - Does case matter? e.g. is "David" the same as "david"? 
  - What do I do if I'm given the string 'David', do I need to do anything with the string? 
    - The interviewer might want you to perform some transformations on the string before returning the result. 


## What are some general principles for pseudocode? 

- **Separate** problem-solving from implementation/coding by using plain English 
  - e.g. Good: `Append the character to the array`  
- Why?
  - **Flexibility**. Using plain English helps you think _abstractly_ about the problem, so that you are more open to and more likely to notice better solutions. 

- **Avoid using syntax specific to your programming language.** 
  - e.g. Bad: `arr << char`. 
  - Being too specific locks you into a single coding path and makes your algorithm inflexible. If you end up finding a bug, then it'll be harder to debug your algorithm. 

- Start high-level. Then, abstract steps that are too complex to be explained in a single statement into helper methods. e.g.: 

```rb

# Problem: Given an array of numbers, find all subsets of numbers that have the same digits forward and backwards. 

# High-level ALgorithm: 
# Initialize a reversible_nums_arr variable to an empty array
# Initialize a subsets_arr that contains all the subsets of numbers of the input array that have at least 2 digits
# Loop through the subsets in subsets_arr. 
# If the subsets contain numbers are the same forward and backwards, then append the subsets to the subsets_arr. 
# Return the subsets_arr. 
```

This high-level algorithm might raise some questions, such as: 
- How do you find all the subsets of numbers that have at least two digits? 
- How do you determine when the   




