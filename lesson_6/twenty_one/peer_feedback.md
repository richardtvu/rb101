# JD's Feedback.

```rb
player_hand = [{suit: 'hear', rank: 1},{suit: 'diamond', rank: 'Q'}]
```

The hash data structure is better suited for the hand because it doesn't require understanding the implementation details as much, e.g. to get the rank of a card, call `card[:rank]`.

> "The reason being that later methods that call the card rank like card[1] require enough knowledge of the data structure that the programmer knows how to reference the card when accessing it's specific components.
whereas if you say, call #map on an array of hashes and pass in a block with a single block parameter 'card', you can reference the suit and rank easily by calling card[:rank] in the block.
Not necessary to dissect your code just to make that change, but worth future consideration."
- J.D. Fortune, *Personal Communication*, August 9, 2022.


## How would you alter the deck data structure?


```rb

SUITS = %w(♥ ♣ ♦ ♠).freeze
VALUES = (2..9).to_a.concat(%w(J Q K A)).freeze
ACE = 'A'.freeze
HIDDEN_CARD = {suit: '?', rank: '?'}.freeze

=begin
Example:
[["♠", 2], ["♣", 3], ..., ["♥", 6], ["♣", 2], ["♠", 9]]

Becomes:
[{:suit=>"♥", :rank=>4}, {:suit=>"♠", :rank=>7}, {:suit=>"♦", :rank=>9}, {:suit=>"♥", :rank=>"Q"}, {:suit=>"♠", :rank=>9}]
=end
```

Iterate over each sub-array, representing a card.
Transform each sub-array into a hash containing the suit- and rank-value pairs.

```rb
def initialize_deck
  arr_of_arrays = SUITS.product(VALUES).shuffle

  arr_of_arrays.map do |card|
    hash = Hash.new
    hash[:suit] = card[0]
    hash[:rank] = card[1]
    hash
  end
end
```