=begin
Input: String
Output: Hash
Req:
- Hash contains 3 entries:
  - Lowercase % of chars
  - uppercase %
  - neither %
- Assume string has at least 1 char.

Implicit:
- 1 decimal place/use floats.
- Spaces, numbers, +, etc. are not letters.

Data structure:
- Array
- Hash

Algorithm:

Count occurrences of each unique character.
Iterate through the unique characters.
- If lowercase, then add to lowercase count
- Else if uppercase, add to uppercase count
- Else add to neither count

Calculate percentages based on total.

Count the lowercase in the string.
Counter uppercase in the string
Count the niether.
Calculate percentages.
Initialize a percentages hash with the percentages.

=end

# Initial Solution 
def letter_percentages(str)
  lowercase_count = str.count('a-z')
  uppercase_count = str.count('A-Z')
  neither_count = str.size - lowercase_count - uppercase_count
  total = str.size.to_f
  percentages = {
    lowercase: lowercase_count / total * 100,
    uppercase: uppercase_count / total * 100,
    neither: neither_count / total * 100
  }
  percentages.each_pair { |type, perc| percentages[type] = perc.round(1) }
end

# Refactored post LS viewing. 
def letter_percentages(str)
  counts = {}
  percentages = {}
  size = str.size

  counts[:lowercase] = str.count('a-z')
  counts[:uppercase] = str.count('A-Z')
  counts[:neither] =   str.count('^a-zA-Z')

  calculate(percentages, counts, size)

  percentages
end

def calculate(percentages, counts, length)
  percentages[:lowercase] = (counts[:lowercase] / length.to_f) * 100
  percentages[:uppercase] = (counts[:uppercase] / length.to_f) * 100
  percentages[:neither] = (counts[:neither] / length.to_f) * 100
  percentages.each { |type, perc| percentages[type] = perc.round(1) }
end


# LS using 

puts letter_percentages('abCdef 123') #== { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
puts letter_percentages('AbCd +Ef')   #== { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
puts letter_percentages('123')        #== { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }

puts letter_percentages('abcdefGHI')
