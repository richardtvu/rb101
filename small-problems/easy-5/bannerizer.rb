=begin
Bannerizer
https://launchschool.com/exercises/29ffd590

- Input: String
- Output: String
- Requirement:
  - The output will be in a box.
  - Input will always fit into your terminal window.

  - Implicit Requirements:
    - An empty input will display a box that is 5 lines in height and 4 characters in width.
    - There will be one space on the left and right of the string.
    - The string will be centered, on line 3.
    - The 1st line of the box will have the first and last characters be "+".
      - The # of `-`` between the `+` will be 2 more than the size of the input string.
    - The third line will be a `| `, the string, and ` |`.
    - The 2nd and 4th lines will have a `|` followed by 2 more than the size of the input string in spaces and a `|`.
    - The 5th line will be the same as the first line.

  - Questions:
    - What's the maximum # of characters in the string?

Data Structures?
- No intermediates, just regular Strings.

Algos?
- Get the size of the string, size.
- Output the first line: `+` followed by `size + 2` of `-` and then `+`.
- Output the 2nd line: `|` followed by `size + 2` of `-` and then `|`.
- Output the 3rd line: `|` followed by ` ` + string + ` ` + `L`
- Output the 4th line, see 2nd line.
- Output the 5th line, see first line.

=end

# Initial Solution
def print_line(begin_end, padded_size, str, padstr = str)
  puts begin_end + str.center(padded_size, padstr) + begin_end
end

def print_in_box(str)
  padded_size = str.size + 2
  print_line('+', padded_size, '-')
  print_line('|', padded_size, ' ')
  print_line('|', padded_size, str, ' ')
  print_line('|', padded_size, ' ')
  print_line('+', padded_size, '-')
end

# LS Solution
# A lesson in simplicity! I was too focused on the implementation that
# I missed the abstraction I could've used with horizontal rule and empty
# lines.
def print_in_box(msg)
  horizontal_rule = "+#{'-' * (msg.size + 2)}+"
  empty_line      = "|#{' ' * (msg.size + 2)}|"

  puts horizontal_rule
  puts empty_line
  puts "| #{msg} |"
  puts empty_line
  puts horizontal_rule
end

# Further Exploration part 1:  Truncate
TERMINAL_WIDTH = 80
MAX_MSG_WIDTH = TERMINAL_WIDTH - 2
def print_in_box(msg)
  msg = msg[0, MAX_MSG_WIDTH]
  horizontal_rule = "+#{'-' * (msg.size + 2)}+"
  empty_line      = "|#{' ' * (msg.size + 2)}|"

  puts horizontal_rule
  puts empty_line
  puts "| #{msg} |"
  puts empty_line
  puts horizontal_rule
end

# Further Exploration part 2:  Word Wrap
TERMINAL_WIDTH = 80
MAX_MSG_WIDTH = TERMINAL_WIDTH - 2

# Split the msg into characters.
# Pop the last MAX_MSG_WIDTH of characters off the characters array
# Join the characters.
# Pad the message if it's not the max_msg_width.
# Output that part of the msg.
# Keep doing the above until there are no more chars in the character array.

def output_word_wrapped_msg(msg)
  msg_chars = msg.chars
  while msg_chars.size > 0
    part_msg = msg_chars.shift(MAX_MSG_WIDTH).join
    puts "| #{part_msg.center(MAX_MSG_WIDTH)} |"
  end
end

## NEEEDS debugging
def print_in_box(msg)
  horizontal_rule = "+#{'-' * (msg.size + 2)}+"
  empty_line      = "|#{' ' * (msg.size + 2)}|"

  puts horizontal_rule
  puts empty_line
  output_word_wrapped_msg(msg) if msg.size > MAX_MSG_WIDTH
  puts "| #{msg} |" unless msg.size > MAX_MSG_WIDTH
  puts empty_line
  puts horizontal_rule
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')
print_in_box('Four score and seven years ago our fathers brought forth on this continent, a new nation, conceived in Liberty, and dedicated to the proposition that all men are created equal. Now we are engaged in a great civil war, testing whether that nation, or any nation so conceived and so dedicated, can long endure. We are met on a great battlefield of that war. We have come to dedicate a portion of that field, as a final resting place for those who here gave their lives that , that nation might live. It is altogether fitting and proper that we should do this. But, in a larger sense, we cannot dedicate—we cannot consecrate—we cannot hallow—this ground. The brave men, living and dead, who struggled here, have consecrated it, far above our poor power to add or detrac')

# Message Amy I was wrong. You _CAN_ use .join on an array of digits to get a string!
