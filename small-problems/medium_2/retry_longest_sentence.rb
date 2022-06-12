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

# def read_sentences_from_file(file_path = 'texts/t.txt')
#   sentences = File.open(file_path)
#       .readlines        # Gets a list of all lines in the text file.
#       .map(&:strip)     # Gets rid of line feeds and extra whitespaces. 
#       .join(" ")        # Reconstructs text.
#       .split(/\.|\?|!/) # Splits sentences based on sentence-ending chars.
#       .map(&:strip)     # Gets rid of leading and trailing spaces. 
# end

def read_sentences_from_file(file_path = 'texts/frankenstein.txt')
  sentences = File.open(file_path)
    .read
    .gsub(/\n/, ' ')  # Gets rid of the pesky line feeds. 
    .split(/\.|\?|!/) 
end

def longest_sentence_from_file(file_path)
  sentences = File.open(file_path).read
    .gsub(/\n/, ' ')  # Gets rid of the pesky line feeds. 
    .split(/\.|\?|!/) # Splits based on `.`, `?`, and `!`. 

  sentences.max_by { |sentence| sentence.split.size }.strip
end 

def print_longest_sentence(file_path = 'texts/t.xt')
  longest_sentence = longest_sentence_from_file(file_path)
  num_words = longest_sentence.split.size

  puts "The longest sentence is:\n#{longest_sentence}."
  puts "Number of words: #{num_words}"
end

print_longest_sentence('texts/lincoln.txt')
print_longest_sentence('texts/frankenstein.txt')

