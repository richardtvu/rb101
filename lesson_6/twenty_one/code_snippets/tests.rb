require_relative '21'

def test_player_wants_to?
  player_wants_to? 'hit'
  player_wants_to? 'continue'
  player_wants_to? 'stay'
  player_wants_to? 'start over'
end

def test_initialize_player
  initialize_players
  # players.each do |player|
  #   p player
  # end
end

def test_winner?(score)
  players = initialize_players(3, :test)
  players.last[:score] = score
  winner?(players)
end

def test_play_round!
  players = initialize_players(2, :test)
  play_round!(players)
  p 'Ran test test_play_round!()'
end

def test_deal!(deck, players = nil, num_cards = 1)
  players.nil? ? players = initialize_players(1, :test) : players
  players.each do |player|
    deal!(deck, player, num_cards)
    prompt "#{player[:name]}: #{player[:hand]}"
  end
end

# test_deal!(initialize_deck)

def test_empty_hands!(players = nil, num_cards = 2)
  deck = initialize_deck
  players.nil? ? players = initialize_players(1, :test) : players
  players.each do |player|
    deal!(deck, player, num_cards)
    puts "Before: #{player[:hand]}."
  end

  empty_hands!(players)
  players.each do |player|
    puts "After: #{player[:hand]}"
  end
end

def test_deal_cards!(deck = initialize_deck, players = nil)
  players.nil? ? players = initialize_players(1, :test) : players

  deal_cards!(deck, players)

  players.each do |player|
    prompt "#{player[:name]}: #{player[:hand]}"
  end
end

# test_deal_cards!

def test_split_into_rows_of(cards, num_cards_per_row = 6)
  split_into_rows_of(num_cards_per_row, cards)
end

def test_display_cards
  deck = initialize_deck
  player = initialize_player(1, :test)
  deal!(deck, player, 12)
  display_cards(player)
end

# test_display_cards

def test_display_table(view = 'player')
  deck = initialize_deck
  players = initialize_players(2, :test)
  deal_cards!(deck, players, 6)
  display_table(players, 71, view)
end

# loop do
#   test_display_table("player")
#   puts "Player view"
#   binding.pry
#   test_display_table('dealer')
#   puts "Dealer View"
#   binding.pry
# end

def test_winner_of_round
  deck = initialize_deck
  players = initialize_players(2, :test)
  players.first[:hand] = [['♠', 'A'], ['♠', 'A'], ['♠', 'A']]
  deal_cards!(deck, players, 1)

  players.each do |player|
    puts "#{player[:name]} #{player[:hand]}
    #{player[:total]}"
  end
end

def test_display_result
  deck = initialize_deck
  players = initialize_players(2, :test)
  deal_cards!(deck, players, 3)
  winner = round_winner(players)
  update_score!(winner)
  display_result(players, winner)
end

def test_show_game_result
  players = initialize_players(2, :test)

  players.each do |player|
    player[:total] = rand(22)
  end

  players[rand(players.size)][:score] = 5
  winner = round_winner(players)
  update_score!(winner)
  show_game_result(players, winner)
end

def test_good_bye
  good_bye
end

# welcome_player
# test_good_bye
# test_display_result
test_show_game_result
# main

# test_winner_of_round
