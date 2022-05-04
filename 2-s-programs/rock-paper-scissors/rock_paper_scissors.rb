VALID_CHOICES = %w(rock paper scissors lizard spock)

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
    prompt "You can enter the first letter or two to select a choice: , e.g. 'r' for 'rock' and 'sp' for 'spock'." 
    choice = gets.chomp
    valid_choice = get_closest_choice(choice) 
    break valid_choice if valid_choice
    prompt("That's not a valid choice.")
  end
end

def get_outcome(choice, computer_choice)
  return "You tied!" if choice == computer_choice
  return "You won!" if PLAYER_WINS.include?([choice, computer_choice])
  "You lost :(."
end

def play_again?
  prompt "Would you like to play again? Enter y to play again."
  answer = gets.chomp.downcase
  return true if answer.start_with?('y')
  false
end

def win?(first, second)
  (first == 'scissors' && second == 'paper') ||
  (first == 'scissors' && second == 'lizard') ||
  (first == 'paper' && second == 'rock') ||
  (first == 'paper' && second == 'spock') ||
  (first == 'rock' && second == 'lizard') ||
  (first == 'rock' && second == 'scissors') ||
  (first == 'lizard' && second == 'spock') ||
  (first == 'lizard' && second == 'paper') ||
  (first == 'spock' && second == 'scissors') ||
  (first == 'spock' && second == 'rock') 
end


def get_results(player_choice, computer_choice)
  if win?(player_choice, computer_choice)
     1
  elsif win?(computer_choice, player_choice)
    -1
  else
     0 
  end
end

def display_results(result)
  prompt "Player won!" if result == 1
  prompt "It's a tie!" if result == 0 
  prompt "Computer won!" if result == -1
end

def grand_winner?(user_wins, computer_wins) 
  return true if user_wins >= 3 || computer_wins >= 3
  false 
end 

def display_grand_winner(num_wins_user, num_wins_computer) 
  if num_wins_user >= 3
    prompt "User is the grand winner!" 
  else 
    prompt "Computer is the grand winner!" 
  end 
end 

wins_user = 0 
wins_computer = 0 

loop do
  choice = get_choice
  computer_choice =  VALID_CHOICES.sample

  prompt "You chose: #{choice}. Computer chose: #{computer_choice}"

  outcome = get_results(choice, computer_choice)
  display_results(outcome)   
  
  if outcome == 1
    wins_user +=1 
  elsif outcome == -1 
    wins_computer +=1 
  end 

  prompt "User: #{wins_user}. Computer: #{wins_computer}."

  if grand_winner?(wins_user, wins_computer) 
    display_grand_winner(wins_user, wins_computer) 
    break unless play_again?
  end  

end

prompt "Good bye!"
