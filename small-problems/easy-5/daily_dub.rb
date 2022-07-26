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
dup_chars = ['ddd', 'aa', ']
current_char => 'd'
last_char => 'a'
consecutive_appearances => 1
if the current character is not equal to the last_char.
  if last_char consecutive_appearances >= 2:
    Add the last_char * consecutive appearances to the list of dup_chars.
  Reset the consecutive appearances to 1.
Else increment the consecutive appearances.

=end

def dup_chars(str)
  dup_char_seqs = []
  last_char = ''
  count = 0
  str.chars.each do |char|
    if char == last_char
      count += 1
    else
      dup_char_seqs << (last_char * count) if count >= 2
      count = 1
    end
    last_char = char
  end
  dup_char_seqs << (str[-1] * count) if count >= 2
  dup_char_seqs.uniq.sort_by { |seq| -seq.size }
end

# p dup_chars('addd laadd maaad')
# p dup_chars('ddaaiillyy ddoouubbllee')
# p dup_chars('4444abcabccba')
# p dup_chars('ggggggggggggggg')
# p dup_chars('a')
# p dup_chars('')

def crunch(str)
  crunched_str = str
  dup_chars(str).each do |dups|
    crunched_str.gsub!(dups, dups[0])
  end
  crunched_str
end

#---------LS Solution Modified -------
def crunch(text)
  crunch_text = ''
  text.chars.each_with_index do |char, index|
    crunch_text << char unless char == text[index + 1]
  end
  crunch_text
end

# -------- Post Student Solutions Revision -----
def crunch(text)
  text.chars.each_with_object('') do |char, crunch_text|
    crunch_text << char unless char == crunch_text[-1]
  end
end

def crunch(str)
  saved = ' '
  new_str = str.chars.select do |char|
    if char == saved then false
    else
      saved = char
      true
    end
  end
  new_str.join
end

def crunch(input)
  result = ''

  input.chars.each do |char|
    result << char unless result.chars.last == char
  end

  result
end

# p crunch('addd laadd maaad')
p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''

# How would I use squeeze/squeeze! to simplify the solution?
