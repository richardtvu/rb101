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

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest')  == true
