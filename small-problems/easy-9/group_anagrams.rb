=begin

- Input: Array (of words)
- Output: Groups of anagrams
- Requirements:
  - Print the groups of anagrams on separate lines.
  - Print the anagrams as arrays
  - The elements in the groups will be sorted in alphabetical order.

Data Structure?
- Array and Hash.
- Hash, containing the letters for a word and the words that can be made using those letters.

Algorithm:
- Create a new hash to store the groups of anagrams.
- Iterate over each word in words.
  - Sort the word in alphabetical order.
  - If the sorted word is not in the hash, add the word to the hash as a key and the unsorted word as a value in an array.
  - Else append the unsorted word to the array corresponding to the word key.

- Iterate over the values in the hash.
  - Output the array literals.
=end

def sort(word)
  word.chars.sort.join
end

def print_anagrams(words)
  anagram_groups = {}

  words.each do |word|
    sorted_word = sort(word)
    if anagram_groups[sorted_word]
      anagram_groups[sorted_word] << word
    else
      anagram_groups[sorted_word] = [word]
    end
  end

  anagram_groups.each_value { |group| p group.sort }
end

words = ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
         'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
         'flow', 'neon']

print_anagrams(words)
