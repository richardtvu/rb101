# Twenty One - A Card Game
=begin

=end

require 'pry'

CARDS = ((2..9).to_a + %w(J Q K A)).freeze
SUITS = %w(Clubs Diamonds Hearts Spades).freeze

def prompt(msg)
  puts "==> #{msg}\n\n"
end

def welcome_player; end


# Credit: JD Fortune & Amy D.
def deck(suits, cards)
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


def random_card(deck)
  suit = deck.keys.sample
  suit_cards = deck[suit]
  card = suit_cards.sample
  [suit, card]
end

def deal!(deck, hand)
  2.times do
    suit, card = random_card(deck)
    card = deck[suit].delete(card)

    if hand[suit]
      hand[suit] << [card]
    else
      hand[suit] = [card]
    end
  end
end

def deal_cards!(deck, player_cards, dealer_cards)
  deal!(deck, player_cards)
  deal!(deck, dealer_cards)

  p player_cards
  p dealer_cards
  nil
end


# CONTINUE WITH BUILDING SHOW_CARDS METHOD
def show_cards(player_cards, dealer_cards)
  p player_cards
  p dealer_cards
end


def stay?() end
def hit!(deck, hand) end
def busted?(hand) end

def take_turn!(deck, player_cards, dealer_cards, turn_player = :player)
  hand = (turn_player == :player) ? player_cards : dealer_cards

  loop do
    show_cards(player_cards, dealer_cards)
    break if stay?(turn_player)

    hit!(deck, hand)
    break if busted?(hand)
  end
end

def play_game!(deck, player_cards, dealer_cards)
  deal_cards!(deck, player_cards, dealer_cards)

  take_turn!(deck, player_cards, dealer_cards.first)
  take_turn!(deck, player_cards, dealer_cards, :dealer)
end

# TODO: The dealer must hit if the total value of his
# deck is less than 17. Else, the dealer will stay.
def dealer_choice(cards); end

def user_choice(); end

def stay?(choice = :user, cards = nil)
  return dealer_choice(cards) if choice == :dealer

  user_choice
end

# TODO
def play?
  true
end

def value(card_symbol)
  case card_symbol
  when (2..10) then card_symbol
  when 'J', 'Q', 'K' then 10
  when 'A' then 11
  end
end

def num_aces(cards)
  cards.count('A')
end

def adjust_score(score, num_aces)
  return score if num_aces < 1

  until score <= 21 || num_aces.zero?
    score -= 10
    num_aces -= 1
  end
  score
end

def score(cards)
  cards = cards.values.flatten

  score = cards.map { |card| value(card) }.sum

  adjust_score(score, num_aces(cards))
end

def results(player_cards, dealer_cards)
  player_score = score(player_cards)
  dealer_cards = score(dealer_cards)

  case (player_score <=> dealer_cards)
  when -1 then 'Player lost!'
  when 0 then 'Tie!'
  when 1 then 'Player wins!'
  end
end

def main
  welcome_player

  # TODO:
  deck = shuffle(deck())
  player_cards = {}
  dealer_cards = {}

  play_game!(deck, player_cards, dealer_cards) if play?

  prompt results(player_cards, dealer_cards)
end

main
