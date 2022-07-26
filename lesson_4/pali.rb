# def substrings(str)
#   result = []
#   starting_index = 0;

#   while (starting_index <= str.length - 2)
#     num_chars = 2
#     while (num_chars <= str.length - starting_index)
#       substring = str.slice(starting_index, num_chars)
#       result << substring
#       num_chars += 1
#     end
#     starting_index += 1
#   end
#   result
# end

# def is_palindrome?(str)
#   str == str.reverse
# end

# def palindrome_substrings(str)
#   result = []
#   substrings_arr = substrings(str)
#   substrings_arr.each do |substring|
#     result << substring if is_palindrome?(substring)
#   end
#   result
# end

def is_palindrome?(str)
  str == str.reverse
end

def substrings(str)
  substrings_arr = []
  current_index = 0
  while current_index < str.length
    substr = ''
    string_slice = str.slice(current_index, str.size)
    string_slice.chars.each do |letter|
      substr += letter
      substrings_arr << substr if substr.size >= 2
    end
    current_index += 1
  end
  substrings_arr.uniq
end

def palindrome_substrings(string)
  palindromes = []
  substrings_arr = substrings(string)
  substrings_arr.each do |substr|
    palindromes << substr if is_palindrome?(substr)
  end
  palindromes
end

# Test cases:

p palindrome_substrings('supercalifragilisticexpialidocious') #== ["ili"]
p palindrome_substrings('abcddcbA') #== ["bcddcb", "cddc", "dd"]
p palindrome_substrings('palindrome') #== []
p palindrome_substrings('') #== []
