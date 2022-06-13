=begin
# Now I Know My ABCs

Hash? Letters...

Basically, cannot use both letters.
So algo:

Hash of spelling blocks
Iterate over the string:
- If a character is found in the keys, remove the key from hash
- Else if a character is found in the values , remove the key from hash
- Else # The block has already been used up.
  # Return false

  Return true

=end

SPELLING_BLOCKS = {
  B: 'O', X: 'K', D: 'Q',
  C: 'P', N: 'A', G: 'T',
  R: 'E', F: 'S', J: 'W',
  H: 'U', V: 'I', L: 'Y',
  Z: 'M'
}

# Initial Solution 
def block_word?(str)
  remaining_blocks = SPELLING_BLOCKS
  chars = str.chars.map(&:upcase)

  chars.each_with_index do |char, i| 
    if remaining_blocks.keys.map(&:to_s).include?(char) 
      remaining_blocks.delete(char.to_sym)
    elsif remaining_blocks.values.include?(char)
      chars.delete_at(i)
    else
      return false 
    end 
  end 
  true 
end

# Attempt to Recall LS Solution? 
=begin 

ALGO? 
Initialize a constant, `BLOCKS`, containing 2-letter blocks. 

Define a method `block_word?` that accepts a `str`. Upcase the string. Iterate through the blocks. Count the number of occurrences of either letter in block in the string. Return false if the count is 2 or greater, which indicates either both letters are used or the block is used more than once. Otherwise, at the end of iteratation, return true. 


=end 

BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VU LY ZM).freeze 

def block_word?(str) 
  up_str = str.upcase 
  BLOCKS.none? ( |block| up_str.count(block) >= 2 )
end 


p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest')  == true



