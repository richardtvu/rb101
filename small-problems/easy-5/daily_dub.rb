=begin 
ddaaiillyy ddoouubbllee
https://launchschool.com/exercises/690b2900

- Input: String 
- Output: String 
- Requirements: 
  - The new String will remove consecutive duplicate characters, so each character will be different from the character before and after it. 
  - Do not use #squeeze or #squeeze!
  - Implicit Requirements: 
    - An input of a string with 0 or 1 characters will have an output of that string value. 
    - You can have more than one of the same character, as long as these characters are not next to each other. 

DS/Algos: 
- Array

Identify consecutive dup chars (2+) in the string. 
Add consec. dup chars to a list. 
Go back to the string and replace dup chars with a single chars. 

How do I get the consecutive duplicate chars? 
- Input: Str 
- Output: Array (of strings) 
- Requirements: 
  - The array will contain strings of duplicate characters.
  - The array will sorted by size in reverse order (i.e. ['ddd', 'dd']). 
  - The sequences will be unique, i.e. ['ddd', 'ddd'] => ['ddd']

Examples 
"addd laadd maaad" => ['ddd', 'aaa', 'dd', 'aa']
"a" => [] 
"4444abcabccba" => ['4444', 'cc']
"ddaaiillyy ddoouubbllee" => ['dd','aa','ii','ll','yy','oo','uu', 'bb', 'll', 'ee']

DS
- Input: Str
- Intermediate: Array, Hash (to keep track of count) 
- Output: Array 

Algo? 
Initialize a local variable last_char to the first character of the string.  
Initialize a local variable consecutive_dups to []. 
Initialize a local variable consecutive_appearances to 0. 
Iterate through the input str. 
- Incrementing consecutive_appearances if the current_char is equal to the last_char. Otherwise: 
  - If the consecutive appearances is higher than 2 and current_char is different from the last_char, then add the last_char * consecutive_appearances to the consecutive_dups array. Then, Reset the consecutive appearances to 0.
  - 
- Set the last_char to the current_char. 

When do I reset the consecutive appearances? 


"addd laadd maaad
consecutive_dup_chars = ['ddd']
current_char => ' ' 
last_char => 'd' 
if the current character is not equal to the last_char. 
  if last_char consecutive_appearances >= 2:
    Add the last_char * consecutive appearances to the list of consecutive_dup_chars. 
  Reset the consecutive appearances to 1. 
Else increment the consecutive appearances. 


=end 

def crunch(str) 
  crunched_str = ''
  consecutive_dup_chars = get_uniq_dup_seq(str) 
  consecutive_dup_chars.each do |dup_chars|
    single_char = dup_chars.uniq 
    crunched_str = str.gsub(dup_chars, single_char)
  end 
  crunched_str
end 





# How would I use squeeze/squeeze! to simplify the solution? 