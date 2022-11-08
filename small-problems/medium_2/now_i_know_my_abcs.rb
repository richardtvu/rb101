=begin

Now I Know My ABCs
https://launchschool.com/exercises/41e03303

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

This limits the words you can spell with the blocks to just those words that do not use both letters from any given block. Each letter in each block can only be used once.

Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, false otherwise.

I - String
O - Boolean
R:
- Return true when words can be spelled using only the letters from the blocks provided.
- Only a single letter from each block may be used.
- Each block may be used only once.
- Letters are not case-sensitive.

Data Structure:
- Hash

Algo:
1. Convert string to all uppercase letters.
2. Iterate over each character:
  If the character exists as a key or a value
    Delete the key-value pair that contains the character.
  Else
    Return false, since there is no letter to use...

=end

BLOCKS = {
  'B' => 'O', 'X' => 'K', 'D' => 'Q',   'C' => 'P',   'N' => 'A',
  'G' => 'T', 'R' => 'E', 'F' => 'S',   'J' => 'W',   'H' => 'U',
  'V' => 'I', 'L' => 'Y', 'Z' => 'M'

}.freeze


def blocks_contain_char?(blocks, char)
  !!blocks[char] || blocks.values.include?(char)
end

def delete_char_from_blocks(blocks, char)
  blocks.delete_if do | k, v |
    [k, v].include?(char)
  end
  nil
end

def block_word?(str)
  blocks = BLOCKS.dup
  str = str.upcase

  str.each_char do |char|
    return false unless blocks_contain_char?(blocks, char)

    delete_char_from_blocks(blocks, char)
  end
  true
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest')  == true
