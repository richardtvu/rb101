require 'yaml' 

# The Rock Paper Scissors program currently supports English, 'en'. 
LANGUAGE = 'en' 
MESSAGES = YAML.load_file('messages_rps.yml')
VALID_OPTIONS = ['x', 'o']
EMPTY = '' 


# ========= Methods ==========

def messages(message, lang=LANGUAGE)
  MESSAGES[lang][message]
end

def prompt(message)
  puts "=> #{message}\n\n"
end

# Potential method for getting user's name/personalization. 

def get_player_choice
  prompt "Do you want to be 'x' or 'o'? (Input 'x' or 'o')"
  choice = nil 
  loop do 
    choice = gets.chomp.downcase 
    break if VALID_OPTIONS.include?(choice)
    prompt "That's not a valid choice. Please choose 'x' or 'o'."
  end 
  choice 
end

# =========== MAIN ============

prompt messages("welcome")
loop do # Main Loop 

  player_choice = get_player_choice
  p player_choice




  # DISPLAY Results 

  

  prompt messages("play_again")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end 

prompt messages("good_bye")
# END 