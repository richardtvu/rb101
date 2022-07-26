=begin

# Problem:
- Inputs: Array of elements, (strings?)
- Output: `element => count` e.g. `car => 4`
- Requirements:
  - Words are case-sensitive, i.e. `'CaR' != 'car'`
  - Print each element and the number of times the element appears in the array
  - Create a method called count_occurrences
- Implicit Requirements:
  - The output must be formatted as `element => count`
  with each element:count pair on a new line.
- Questions:
  - What happens when there are 0 elements in the given array?
    - Let's say output nothing.
  - Can there be inputs other than strings? e.g. characters, symbols?
    - Let's say only strings will be passed in.
  - Do element-count pairs need to be printed
  in a particular order? If so, what?
    - Let's say order the element-count pairs in
    order of the first element encountered,
    e.g. ['car', 'truck', 'car']. 'car' comes
    before 'truck', so display the 'car'
    element-count first.

# Examples

- input:
vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

- output:
car => 4
truck => 3
SUV => 1
motorcycle => 2

- input: []
- output: nothing on display

# Data Structure?

- Intermediary? A hash would be make it easier to keep
 track of each element. The word would be the key and
 the count would be the value.

# Algorithm:

START

GIVEN an array of strings (words)
SET counts = Hash.new
FOR each word in words:
  IF the word is NOT in counts:
    # SET counts[word] = 1
  ELSE
    # SET counts[word] += 1

FOR each count, value in counts:
  PRINT '#{count} => #{value}'

END

=end

# CODE (with intent)

def count_occurrences(words)
  counts = Hash.new

  words.each do |word|
    if counts.include?(word)
      counts[word] += 1
    else
      counts[word] = 1
    end
  end

  counts.each_pair do |count, value|
    puts "#{count} => #{value}"
  end
end

vehicles = %w(
  car car truck car SUV truck
  motorcycle motorcycle car truck
)

count_occurrences(vehicles)
