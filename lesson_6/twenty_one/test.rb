# cards = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

# deck = {
#   h: cards.dup,
#   d: cards.dup,
#   s: cards.dup,
#   c: cards.dup
# }


# p new_deck

CARDS = ((2..9).to_a + %w(J Q K A)).freeze
SUITS = %w(Clubs Diamonds Hearts Spades).freeze

def deck(suits, cards)
  deck = suits.map do |suit|
    [suit, cards.dup]
  end.to_h

  deck.keys.map.with_object([]) do |suit, new_deck|
    new_deck << "#{suit}:#{deck[suit].pop}" until deck[suit].empty?
  end
end

p deck(SUITS, CARDS)