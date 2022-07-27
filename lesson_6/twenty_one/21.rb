# Twenty One - A Card Game

CARDS = ((2..9).to_a + %w(Jack Queen King Ace)).freeze
SUITS = %w(Clubs Diamonds Hearts Spades).freeze

def clear_screen
  system('cls') || system('clear')
end

def prompt(msg)
  puts "==> #{msg}\n\n"
end

# Disabled this cop because I'd rather not create a YML file
# and load up the message from there.
def welcome_player # rubocop:disable Metrics/MethodLength
  clear_screen
  msg = <<~MSG
Rules of Twenty-One
- You start with a normal 52-card deck consisting of the 4 suits
(hearts, diamonds, clubs, and spades), and 13 values (2, 3, 4, 5,
6, 7, 8, 9, 10, jack, queen, king, ace).

- The goal of Twenty-One is to try to get as close to 21 as possible,
without going over. If you go over 21, it's a "bust" and you lose.

- Setup: the game consists of a "dealer" and a "player". Both
participants are initially dealt 2 cards. The player can see their
2 cards, but can only see one of the dealer's cards.

- Cards 2-10 are worth their face value. Jack, Queen, and king
are worth 10. Ace is worth 1 or 11.

- Player turn: the player goes first, and can decide to either "hit"
or "stay". A hit means the player will ask for another card. Remember
that if the total exceeds 21, then the player "busts" and loses.
The decision to hit or stay will depend on what the player's cards are
and what the player thinks the dealer has. For example, if the dealer
is showing a "10" (the other card is hidden), and the player has a "2"
and a "4", then the obvious choice is for the player to "hit". The
player can continue to hit as many times as they want. The turn is
over when the player either busts or stays. If the player busts, the
game is over and the dealer won.

- Dealer turn: when the player stays, it's the dealer's turn. The
dealer must follow a strict rule for determining whether to hit or
stay: hit until the total is at least 17. If the dealer busts, then
the player wins.
MSG
  prompt msg
end

# Credit: JD Fortune & Amy D for shuffle and deck initialization.
def deck(suits = SUITS, cards = CARDS)
  deck = suits.map do |suit|
    [suit, cards.dup]
  end.to_h

  deck.keys.map.with_object([]) do |suit, new_deck|
    new_deck << "#{deck[suit].pop}:#{suit}" until deck[suit].empty?
  end
end

def shuffle(deck)
  deck.sample(deck.size)
end

def deal!(deck, hand, num_cards = 1)
  num_cards.times.with_object(hand) { hand << deck.pop }
  nil
end

def deal_cards!(deck, player_cards, dealer_cards)
  deal!(deck, player_cards, 2)
  deal!(deck, dealer_cards, 2)
end

def value(card_symbol)
  case card_symbol
  when '2', '3', '4', '5', '6', '7', '8', '9', '10' then card_symbol.to_i
  when 'Jack', 'Queen', 'King' then 10
  when 'Ace' then 11
  end
end

def num_aces(cards)
  cards.count('Ace')
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
  faces = cards.map { |face| face.split(':').first }
  score = faces.map { |face| value(face) }.sum

  adjust_score(score, num_aces(faces))
end

def show_cards(player_cards, dealer_cards)
  clear_screen
  prompt 'Player'
  prompt "#{player_cards}. Score: #{score(player_cards)}\n"
  prompt 'Dealer'
  prompt "#{dealer_cards}. Dealer's Score: #{score(dealer_cards)}\n"
end

def stay?(cards, turn_player)
  case turn_player
  when :player
    response = nil
    loop do
      prompt 'Enter h/hit to hit or s/stay to stay'
      response = gets.chomp.downcase
      break if %w(h s hit stay).include?(response)

      prompt 'Invalid response...'
    end
    %w(s stay).include?(response)
  when :dealer
    score(cards) > 16
  end
end

def hit!(deck, hand)
  deal!(deck, hand)
end

def busted?(hand)
  score(hand) > 21
end

def take_turn!(deck, player_cards, dealer_cards, turn_player = :player)
  hand = dealer_cards
  visible_dealer_cards = hand

  if turn_player == :player
    hand = player_cards
    visible_dealer_cards = [dealer_cards.first]
  end

  loop do
    show_cards(player_cards, visible_dealer_cards)
    break if stay?(hand, turn_player)

    hit!(deck, hand)
    break if busted?(hand)
  end
end

def results(player_cards, dealer_cards)
  show_cards(player_cards, dealer_cards)

  player_score = busted?(player_cards) ? 0 : score(player_cards)
  dealer_cards = busted?(dealer_cards) ? 0 : score(dealer_cards)

  case (player_score <=> dealer_cards)
  when -1 then 'Player lost!'
  when 0 then 'Tie!'
  when 1 then 'Player wins!'
  end
end

def play_game!(deck, player_cards = [], dealer_cards = [])
  deal_cards!(deck, player_cards, dealer_cards)

  take_turn!(deck, player_cards, dealer_cards)

  unless busted?(player_cards)
    take_turn!(deck, player_cards, dealer_cards,
               :dealer)
  end

  prompt results(player_cards, dealer_cards)
end

def play?
  response = nil
  loop do
    prompt 'Enter y/yes to play or n/no to exit.'
    response = gets.chomp.downcase
    break if %w(y yes n no).include?(response)

    prompt 'Invalid response...'
  end
  %w(y yes).include?(response)
end

def main
  welcome_player

  deck = shuffle(deck())

  play_game!(deck) while play?

  prompt 'Good bye!'
end

main
