=begin 
Input: File (text) 
Output: String 
Requirements: 
- Read the contents of a text file 
- Print the longest sentence in the file, based on # of words. 
- Print the # of words in the longest sentence. 
- Sentences are groups of words ending with:
  - Periods (`.`), 
  - Exclamation points, `!`, or
  - Question Marks `?`
- Words are group of characters that aren't only spaces or sentence-ending characters. 

Data Structure? 
- Array 

Algorithm: 
- Read in the text content. 
- Split up the text into a list of sentences, based on periods, exclamation points, and question marks. 
- Sort the sentences in order of ascending size. 
- Get the last sentence. 
- Count the number of words in the last sentence. 
- Print the last sentence. 
- Print the number of words. 

=end 

# text = <<~EOT
#   Abra cadabra. 
#   Molly! Oy?
#   Magickery alloys.
# EOT

# def write_file(fileName, text)
#   File.write(fileName, text)
# end 

# write_file("t.txt", text)

def read_file(filePathName) 
  strings = [] 
  open(filePathName) do |file|
    strings = file.readlines 
  end 
  
  strings.map do |string|
    string.chomp!
  end 
  strings.join(" ")
end 

# Input: String 
# Output: Array of Strings (sentences) 
def get_sentences(text)
  text.split(/[?.!]/)
end 

# example = "Abra cadabra. Molly! Oy?"
# p get_sentences(example) 

def longest_sentence(filePath = "texts/t.txt")
  text = read_file(filePath)

  sentences = get_sentences(text).sort { |a,b| a.size <=> b.size }
  longest_sentence = sentences.last
  num_words = longest_sentence.split.size 

  puts "The longest sentence has #{num_words} words."
  puts "Longest sentence: #{longest_sentence}."
end 

longest_sentence('texts/lincoln.txt')
longest_sentence('texts/frankenstein.txt')

# Continue by creating the file with Lincoln's address and then testing against that. 