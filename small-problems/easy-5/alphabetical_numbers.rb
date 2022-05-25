# Alphabetical Numbers 
=begin 
https://launchschool.com/exercises/c688f4e5
- Input: Array of Integers 
- Output: Array of Integers
- Requirements: 
  - The input integers will be between 0 and 19. 
  - Sort the integers in alphabetical order of the English words that represent the numbers. 

# Data Structure? 
- Hash 
  - Integer to the English Word
  - English word to Integer 

Algos: 
Convert the array of integers into English words. 
Sort the english words in alphabetical order.
Convert the english words back into integers. 
Return the array. 

Sort the array of integers based on their English words. 
How? 




=end 

# Initial Solution 
NUM_WORDS = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen']

def alphabetic_number_sort(int_arr) 
  words = int_arr.zip(NUM_WORDS).to_h
  integers = NUM_WORDS.zip(int_arr).to_h
  words = int_arr.map { |int| words[int]}
  words.sort.map {|word| integers[word]} 
end 

# Official Solution 
def alphabetic_number_sort(arr) 
  arr.sort_by! { |number| NUM_WORDS[number] }
end 

# Further Exploration 
def alphabetic_number_sort(arr) 
  arr.sort { |num1, num2| NUM_WORDS[num1] <=> NUM_WORDS[num2] }
end 

# Why does LS use Enumerable#sort_by instead of Array#sort_by!?
# The only thing I can think of is perhaps we didn't want to mutate the original object, in case we'd want to reuse the object somewhere else? 

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

