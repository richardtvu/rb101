# Deck initialization and shuffle methods.
CARDS = ((2..9).to_a + %w(J Q K A)).freeze
SUITS = %w(Clubs Diamonds Hearts Spades).freeze

def deck(suits = SUITS, cards = CARDS)
  deck = suits.map do |suit|
    [suit, cards.dup]
  end.to_h

  deck.keys.map.with_object([]) do |suit, new_deck|
    new_deck << "#{suit}:#{deck[suit].pop}" until deck[suit].empty?
  end
end

def shuffle(deck)
  deck.sample(deck.size)
end

def shuffle(deck)
  new_deck = []
  new_deck << deck.delete(deck.sample) until deck.empty?
  new_deck
end

deck = shuffle(deck())

# Just to show what the deck looks like
p deck
