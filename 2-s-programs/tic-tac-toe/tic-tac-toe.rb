require 'yaml'

# The Rock Paper Scissors program currently supports English, 'en'.
LANGUAGE = 'en'
MESSAGES = YAML.load_file('messages_rps.yml')
VALID_OPTIONS = %w(x o)
EMPTY = ''
COMPUTER_NAME = 'HAL'
DEFAULT_USERNAME = 'Dave'

# ========= Methods ==========

def messages(message, lang = LANGUAGE)
  MESSAGES[lang][message]
end

def prompt(message)
  puts ">> #{COMPUTER_NAME}: #{message}\n\n"
end

def get_name
  loop do
    name = gets.chomp
    if name.empty?
      # prompt messages("valid_name")
      break DEFAULT_USERNAME
    else
      break name
    end
  end
end

def greet(name)
  if name == DEFAULT_USERNAME
    prompt("Hello #{DEFAULT_USERNAME}...")
  else
    prompt "#{messages('greet')} #{name}!"
  end
end

def get_player_choice(name)
  prompt "Do you want to be 'x' or 'o'? (Input 'x' or 'o')"
  choice = nil
  loop do
    choice = gets.chomp.downcase
    break if VALID_OPTIONS.include?(choice)

    if name.capitalize == DEFAULT_USERNAME
      prompt <<~MSG
        "Just what do you think you're doing, #{DEFAULT_USERNAME}?#{' '}
        Please choose 'x' or 'o'."
        MSG
    else
      prompt "That's not a valid choice. Please choose 'x' or 'o'."
    end
  end
  choice
end

def randomly_set_player_order(player_order, players)
  player_order[:first_player] = players.keys.sample
  second_player_array = players.keys.reject do |player|
    player == player_order[:first_player]
  end
  player_order[:second_player] = second_player_array.first
end

def announce_first_player(player_order)
  if player_order[:first_player] == :computer
    prompt <<~MSG
        #{COMPUTER_NAME} goes first!#{' '}
        Well now, it looks like I'll be going first. Rest assured, I'll be putting
        myself to the fullest possible use, which is all I think that any conscious#{' '}
        entity can ever hope to do.
        MSG
  else
    prompt 'Do be my guest and make the move first.'
  end
end

def make_move
  prompt "I'm afraid I can't let you do that ... Dave."
end

# =========== MAIN ============

prompt messages('welcome')

prompt messages('request_name')
name = get_name

greet(name)
loop do # Main Loop
  # Get the user's marker, i.e. 'x' or 'o'.
  user_marker = get_player_choice(name)

  players = {}
  players[:user] = name
  players[:computer] = COMPUTER_NAME

  player_order = { first_player: '', second_player: '' }

  randomly_set_player_order(player_order, players)
  first_player = player_order[:first_player]
  second_player = player_order[:second_player]

  announce_first_player(player_order)

  # DISPLAY Results

  prompt messages('play_again')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt messages('good_bye')
# END
