=begin
Input: Integer (`n`, odd int)
Output: 4-pointed diamond, `n` x `n` grid
Requirements:
- Assume `n` is always an odd integer.
- Implied requirements:
  - Use asterisks to make up the diamond.
  - The top level begins with 1 asterisk and increases by 2 until `n`.
  - Pad the rows of stars with less than `n` stars with spaces.

Data Structures:
- String

Algo:
- Print the top portion of stars
- Print the middle stars
- Print the bottom portion of asterisks

How to print top?
- Start with 1 asterisk and pad either side until total chars is `n`.
- Print line
- Increment asterisks by 2 and decrement padding accordingly.
- Print line
- Repeat above until `n-2`

How to print middle?
- Print `n` asterisks

How to print bottom?
- Start with `n-2` asterisks with padding
- Print line
- Decrement by 2 asterisks. Pad accorddingly.
- Print line
- Repeat until 1 asterisk, pad accordingly, and print line.

=end

# I forgot which method is used to pad strings, so I made one up manually.
def pad_asterisks(stars, n)
  padding = ' ' * ((n - stars) / 2)
  padding + ('*' * stars) + padding
end

def print_top_and_middle(n)
  1.upto(n).each do |stars|
    puts pad_stars(stars, n) if stars.odd?
  end
end

def print_bottom(n)
  (n - 2).downto(1).each do |stars|
    puts pad_stars(stars, n) if stars.odd?
  end
end

def diamond(n)
  print_top_and_middle(n)
  print_bottom(n)
end

diamond(1)
diamond(3)
diamond(9)
