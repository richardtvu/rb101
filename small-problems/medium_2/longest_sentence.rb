=begin
Input: File
Output: String
Requirements:
- Read in a text file.
- Print the longest sentence of the text file.
- Print the # of words in the longest sentence.
- Consider a sentence as a group of words ending with a period, exclamation point, or question mark.
- Consider a word as a group of characters that aren't spaces or sentence-ending characters.
- Count `--` as a word.

Data Structures:
- Array

Algorithm:
- Read in the text file.
- Split up the text file into a list of sentences.
- Find the largest sentence.
- Find the # of words in the largest sentence.
- Print the largest sentence.
- Print the # of words in the largest sentence.
=end

# Ask JD! Curiosity: How do I pass in a string when I call the program, e.g. `ruby retry_longest_sentence.rb [String]`? I mean, how do I take in that string input and use it in the program?

=begin

For whatever reason, I felt irritated by the extra spaces in my result
when I ran LS's solution (See "the most" with a large stretch of before
the next line).

```ruby
"I have seen," he said, "the most
beautiful scenes of my own country; I have visited the lakes of Lucerne
...
Containing 157 words
```

Thus, I spent several hours creating my own version of a word_wrapper to
keep sentences under a certain length, e.g. 80 (chosen for the terminal).
See below for

Result - a more pleasing, in my eyes, display of the longest sentence.
```ruby
"I have seen," he said, "the most beautiful scenes of my own country; I have
visited the lakes of Lucerne and Uri, where the snowy mountains descend almost
...
Number of words: 157
```
=end

def longest_sentence_from_file(file_path)
  sentences = File.read(file_path)
                  .gsub(/\n/, ' ')  # Gets rid of the pesky line feeds.
                  .split(/\.|\?|!/) # Splits based on `.`, `?`, and `!`.

  sentences.max_by { |sentence| sentence.split.size }.strip
end

def line_less_than_char_max(sentence, char_max)
  words = []
  sentence_words = sentence.split(' ')
  last_word_index = 0

  until last_word_index > char_max
    break if sentence_words.empty?

    words << sentence_words.shift
    last_word_index += (words.last.size + 1)
  end
  words.pop

  last_word_index = words.join(' ').size
  sentence[0..last_word_index]
end

def word_wrap(sentence, char_max = 80)
  lines_arr = []

  while sentence.size > char_max
    line = line_less_than_char_max(sentence, char_max)

    lines_arr << line
    sentence.delete_prefix!(line)
  end

  lines_arr << sentence
end

def print_longest_sentence(file_path = 'texts/frankenstein.txt')
  longest_sentence = longest_sentence_from_file(file_path)
  num_words = longest_sentence.split.size

  puts word_wrap(longest_sentence)
  puts "Number of words: #{num_words}"
end

print_longest_sentence('texts/lincoln.txt')
print_longest_sentence('texts/frankenstein.txt')
