# https://github.com/JDFortune/RB101/blob/main/lesson_6/twentyone/twenty_one.rb

SUITS = ['♥', '♣', '♦', '♠'].freeze
CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A'].freeze
HIDDEN_CARD = { suit: '?', rank: ' ' }.freeze

def initialize_shuffled_deck
  deck = SUITS.product(CARDS).shuffle

  deck.map do |card|
    { suit: card[0], rank: card[1] }
  end
end

deck = initialize_shuffled_deck
puts deck
