VALID_CHOICES = %w(rock paper scissors lizard spock)

WINNING_PLAYS = {
  scissors: %w(paper lizard),
  paper: %w(rock spock),
  rock: %w(lizard scissors),
  lizard: %w(spock paper),
  spock: %w(scissors rock)
}

#======================== Methods ==========================

def prompt(msg)
  puts "=> #{msg}\n\n"
end

def get_closest_choice(choice)
  compatible_choices = VALID_CHOICES.select do |word|
    word.start_with?(choice)
  end
  compatible_choices.first
end

def get_choice
  loop do
    prompt "Choose one: #{VALID_CHOICES.join(', ')}"
    prompt 'You can enter the first letter or two to select a choice:' \
           ", e.g. 'r' for 'rock' and 'sp' for 'spock'."
    choice = gets.chomp
    valid_choice = get_closest_choice(choice)
    break valid_choice if valid_choice

    prompt("That's not a valid choice.")
  end
end

def play_again?
  prompt 'Would you like to play again? Enter y to play again.'
  answer = gets.chomp.downcase
  return true if answer.start_with?('y')

  false
end

def win?(first, second)
  WINNING_PLAYS[first.to_sym].include?(second)
end

def get_results(player_choice, computer_choice)
  if win?(player_choice, computer_choice) then :user
  elsif win?(computer_choice, player_choice) then :computer
  else
    :tie end
end

def display_results(result)
  prompt 'Player won!' if result == :user
  prompt "It's a tie!" if result == :tie
  prompt 'Computer won!' if result == :computer
end

def increment_scores!(outcome, scores)
  scores[outcome] += 1
end

def grand_winner?(scores)
  return true if scores[:user] >= 3 || scores[:computer] >= 3

  false
end

def prompt_grand_winner(msg)
  prompt '=' * msg.size
  prompt msg
  prompt '=' * msg.size
end

def display_grand_winner(scores)
  if scores[:user] >= 3 then prompt_grand_winner 'User is the grand winner!'
  else
    prompt_grand_winner 'Computer is the grand winner!' end
end

def reset_scores!(scores)
  scores.transform_values! { |_value| 0 }
end

def clear_screen
  system('clear')
  system('cls')
end

#========================== MAIN ===========================

welcome_msg = <<~MSG
Welcome to Rock Paper Scissors Spock Lizard!#{' '}
============================================
This game is like Rock Paper Scissors, except you get
to have two more choices.#{' '}

- Rock crushes Lizard and Scissors.#{' '}
- Paper beats Spock and Rock.#{' '}
- Scissors chops up Lizard and Paper.#{' '}
- Spock vaporizes Rock and Scissors.#{' '}
- Lizard eats Spock and Paper.#{'  '}
MSG
prompt welcome_msg

scores = { user: 0, computer: 0, tie: 0 }

loop do
  choice = get_choice
  computer_choice =  VALID_CHOICES.sample

  prompt "You chose: #{choice}. Computer chose: #{computer_choice}"

  match_result = get_results(choice, computer_choice)

  display_results(match_result)
  increment_scores!(match_result, scores)
  prompt "User: #{scores[:user]}. Computer: #{scores[:computer]}."

  if grand_winner?(scores)
    display_grand_winner(scores)
    play_again? ? reset_scores!(scores) : break
    clear_screen
  end
end

prompt 'Good bye!'
