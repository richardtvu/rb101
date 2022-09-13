DIGIT_HASH = {
  'zero' => '0', 'one' => '1', 'two' => '2',
  'three' => '3', 'four' => '4', 'five' => '5', 
  'six' => '6', 'seven' => '7', 'eight' => '8', 
  'nine' => '9' 
}

=begin 

=end 

def word_to_digit(str) 
  # Code goes here 
end 

# Test cases 
p word_to_digit('Please call me at five five five one two three four. Thanks.') # == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

# Lower and uppercase words 
p word_to_digit("Please call me at Six niNe eight ZERO zero EIghT five ") 

# Preserve spaces between digits already present. 
p word_to_digit("It's year two zero two Five, 1 0 0 1 humans remain.") #== "It's year 2025, 1 0 0 1 humans remain."

 # Remove spaces between numbers created 
p word_to_digit(" NINE Zero % died while eating chocolate oreos.") #== " 90% died while eating chocolate oreos."

# Format 10-digit numbers as phone numbers. 
p word_to_digit("Call this number to rule the world: zero one two three four five six seven eight nine") #== "Call this number to rule the world: (012) 345-6789"
