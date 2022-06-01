=begin 
Palindromic Substrings 

- Input: String 
- Ouptut: Array (of all palindromic substrings) 
- Requirements: 
  - Include duplicates in output. 
  - Order substrings by order encountered ins tring. 
  - Palindromes are case-sensitive. 
  - Palindromes are at least two characters. 
  - Palindromes are the same string when reversed. 

Data Structure
- Array 

Algo: 
Get a list of all the substrings. 

Tasks: 
- [ ] Incorporate alpha_num_only logic. 

=end 

# Cr: Adam D. 
def leading_substrings(string)
  string.chars.map.with_index { |_, i|string[0..i] }
end 

def substrings(str, alpha_nums_only = true)
  chars = str.chars
  chars = str.delete("^[a-zA-Z0-9]").chars if alpha_nums_only
  chars.map.with_index { |_, i| leading_substrings(chars.join[i..])}.flatten 
end 

p substrings('abc123ABC_```')

def palindrome?(str, case_sensitive = true) 
  return false unless str.size > 1
  str.downcase == str.downcase.reverse if !case_sensitive
  str == str.reverse
end 

def palindromes(str, case_sensitive = true, alpha_nums_only = false)
  substrings(str,alpha_nums_only).select do |substring| 
    palindrome?(substring, case_sensitive)
  end 
end 

p palindromes('abcd')  # == []
p palindromes('madam') # == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

# Need to determine the expected result will be... 
p substrings('hello-madam-did-madam-goodbye').select {|substr|
  palindrome?(substr)
}
# p palindromes('hello-madam-did-madam-goodbye', true, true) 
# == [
#   'll', 'madam', 'madamdidmadam', 'madam', 'madamdidmadam', 'ada',
#   'adamdidmada', 'damdidmad', 'amdidma', 'mdidm', 'did', 'did',
#   'madam', 'madam', 'ada', 'oo'
# ]