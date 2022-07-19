WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals

INITIAL_MARKER  = ' '
PLAYER_MARKER   = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts "=> #{msg}"
end

# 1. Display board.
# Expects a board as a flattened hash, e.g. {1=>' ', ..., 9=>' '}.
def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is a #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end

def initialize_board(marker = INITIAL_MARKER)
  new_board = {}
  (1..9).each { |num| new_board[num] = marker }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |square| brd[square] == INITIAL_MARKER }
end

def player_places_piece!(brd, player_marker = PLAYER_MARKER)
  square = nil
  loop do
    empty_squares = empty_squares(brd)
    prompt "Choose a square: #{empty_squares.join(', ')}"
    square = gets.chomp.to_i
    break if empty_squares.include?(square)

    puts "Choose an empty square..."
  end

  brd[square] = player_marker
  nil
end

# Bonus #1: Improved "join"
def joinor(squares_arr, delimiter = ', ', join_word = 'or')
  arr = squares_arr[0..-1] # To avoid mutating original array.
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{join_word} ")
  else
    arr[-1] = "#{join_word} #{arr.last}"
    arr.join(delimiter)
  end
end

# Bonus TTT #3
def find_at_risk_square(line, board, marker)
  return unless board.values_at(*line).count(marker) == 2

  board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
end

def move_choice(brd, mode = :attack)
  case (mode) 
  when :attack then marker = COMPUTER_MARKER
  when :defend then marker = PLAYER_MARKER
  end 
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, marker)
    return square if square
  end
  nil
end

def attack(brd)
  move_choice(brd, :attack)
end

def defend(brd)
  move_choice(brd, :defend)
end

def computer_places_piece!(brd)
  square = attack(brd)
  square ||= defend(brd)

  square = 5 if !square && empty_squares(brd).include?(5)
  square ||= empty_squares(brd).sample

  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  brd.keys.none? { |square| brd[square] == INITIAL_MARKER }
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

# 4. Determing winner
def detect_winner(brd)
  WINNING_LINES.each do |line|
    return 'Player' if brd.values_at(*line).count(PLAYER_MARKER) == 3
    return 'Computer' if brd.values_at(*line).count(COMPUTER_MARKER) == 3
  end
  nil
end

# Bonus TTT #5 - Computer Turn Refinements
def determine_order
  choices_hash = {
    1 => :player, 2 => :computer, 3 => [:player, :computer].sample
  }
  prompt "Who goes first? Enter #{joinor(choices_hash.keys)}"
  prompt "1) Player"
  prompt "2) Computer"
  prompt "3) Random"

  loop do
    order = gets.chomp.to_i
    break choices_hash[order] if choices_hash[order]

    prompt "Invalid choice..."
  end
end

def place_piece!(board, current_player)
  if current_player == :player
    player_places_piece!(board)
  else
    computer_places_piece!(board)
  end
end

def alternate_player(current_player)
  [:player, :computer].find { |player| player != current_player }
end

# Bonus #6: Improved Game Loop
def make_moves!(board, current_player)
  loop do
    display_board(board)
    break if someone_won?(board) || board_full?(board)
    
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
  end
end

def play
  loop do
    board = initialize_board
    display_board(board)

    make_moves!(board, determine_order)

    if someone_won?(board) then 
      prompt "#{detect_winner(board)} won!"
    else
      prompt "It's a tie!"
    end

    prompt "Play again? (y or n)"
    answer = gets.chomp
    break unless answer.downcase.start_with?('y')
  end

  prompt "Thanks for playing Tic Tac Toe. Goodbye!"
end

play
