=begin

Split up the string into words.
Get the 2nd to last word.

=end
def penultimate(string)
  string.split(' ')[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'
