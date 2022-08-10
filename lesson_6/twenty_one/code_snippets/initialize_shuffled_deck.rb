# https://github.com/JDFortune/RB101/blob/main/lesson_6/twentyone/twenty_one.rb

SUITS = ['♥', '♣', '♦', '♠']
CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
HIDDEN_CARD = { suit: '?', rank: ' ' }

def initialize_shuffled_deck
  deck = SUITS.product(CARDS).shuffle

  deck.map do |card|
    { suit: card[0], rank: card[1] }
  end
end

deck = initialize_shuffled_deck
puts deck