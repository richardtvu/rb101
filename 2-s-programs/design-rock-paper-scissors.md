# Rock Paper Scissors 

## Problem: Create a Rock Paper Scissors game. 
- Inputs: Choice (e.g. an X or an O) 
- Outputs: Display the Winner of Game
- Requirements: 
  - The user will be asked to select a token (i.e. 'x' or 'o'). 
  - The user and the computer shall have different tokens (e.g. user: 'x' vs. computer: 'o'). 
  - The board will be a 3x3 square.
    ```
    [ ] [ ] [ ]    
    [ ] [ ] [ ]    
    [ ] [ ] [ ]   
    ``` 
  - Each square may hold 0 or 1 token. 
      ```
    [x] [ ] [ ] 
    [o] [ ] [ ] 
    [ ] [ ] [ ]
    ``` 
  - The user will go first, followed by the computer.
  - The user and computer will alternate turns.  
  - Once a square is filled during a match, the square shall remain filled for the duration of the match. 
  - A match is defined as the period in which the user and computer take turns until the board is completely filled or there is a winner.  
  - The winner shall be the first to get three in a row, either horizontally, vertically, or diagonally. 
    ```
    # Vertical 
    "x wins!" 
    [ ] [ ] [ ]            [ ] [ ] [x]  
    [ ] [ ] [ ]  ===>      [ ] [o] [x]  
    [ ] [ ] [ ]            [ ] [o] [x] 
    ``` 
    ```
    # Horizontal 
    "o wins!" 
    [ ] [ ] [ ]            [ ] [ ] [ ]  
    [ ] [ ] [ ]  ===>      [x] [ ] [x]  
    [ ] [ ] [ ]            [o] [o] [o] 
    ``` 
    ```
    # Diagonal
    "x wins!" 
    [ ] [ ] [ ]            [ ] [o] [x]  
    [ ] [ ] [ ]  ===>      [ ] [x] [ ]  
    [ ] [ ] [ ]            [x] [o] [ ] 
    ``` 
  - If neither the user or computer get three in a row before the match ends, the result is a tie. 
    ```
    "Tie!" 
    [ ] [ ] [ ]            [o] [o] [x]  
    [ ] [ ] [ ]  ===>      [x] [x] [o]  
    [ ] [ ] [ ]            [o] [o] [x] 
    ``` 


## Examples 


### Vertical 
```
"x wins!" 
[ ] [ ] [x]  
[ ] [o] [x]  
[ ] [o] [x] 
```

### Horizontal 
```
"o wins!"
[ ] [ ] [ ]  
[x] [ ] [x] 
[o] [o] [o] 
```

### Diagonal
```
"x wins!" 
[ ] [o] [x]  
[ ] [x] [ ]  
[x] [o] [ ] 
```

### Tie  
```
"Tie!" 
[o] [o] [x]  
[x] [x] [o]  
[o] [o] [x] 
``` 

# Data Structures 

- A 2-d array to hold the 'x' and 'o' characters. e.g.

```
[ 'x', 'o', ''  ],
[ '' , '' , 'o' ],
[ 'x', '' , 'x' ]
```

- Hash to store the user's character selection, e.g. '{user_char: 'x', computer_char: 'o"} 
- A hash to store the number of matches won by the user/computer (for future development) 

# Algorithm 

Introduce the user to the game and the rules. 
(Optional: Get the user's name). 
Get the user's preferred choice: x or o. 
Randomly pick the first player (i.e. user or computer). 
Have player 1 make a move. 
Have player 2 make a move. 
Repeat until a tie or win occurs. 
Display the winner. 

# Code (with intent) 

```rb

def prompt(message)
  puts "=> #{message}\n\n"
end

welcome_msg = 
  <<~MSG
  Welcome to Tic-Tac-Toe!
  ===========================================================
  Tic-Tac-Toe is a two-player game played in a 3x3 square. 
  You'll alternate putting down an 'x' or an 'o' with a
  computer until one wins or a tie occurs. 

  Game Conditions:
  - Win: You get three in a row (diagonally, horizontally,
  vertically) before the computer.
  - Tie: The board gets filled before either you or the
  computer wins. 
  - Lose: The computer gets three in a row before you. 
  ------------------------------------------------------------
  MSG


=begin
Introduce the user to the game and the rules. 
(Optional: Get the user's name). 
Get the user's preferred choice: x or o. 
Randomly pick the first player (i.e. user or computer). 
Have player 1 make a move. 
Have player 2 make a move. 
Repeat until a tie or win occurs. 
Display the winner. 
=end 

VALID_OPTIONS = ['x', 'o']
EMPTY = '' 

prompt welcome_msg

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

user = get_player_choice

def randomly_select_first_player 
  VALID_OPTIONS.sample
end 

def set_second_player(first_player_choice) 
  VALID_OPTIONS.select { |option| if option == first_player_choice }
end 

first_player = randomly_select_first_player  
second_player = set_second_player(first_player)

def get_new_board(height=3, width=3) 
  board = Array.new 
  height.times { |row| board[row] = [''] * width}
  board
end 

# def get_full_board(height=3, width=3)
#   board = Array.new 
#   height.times { |row| board[row] = ['x'] * width}
#   board
# end 

game_board = get_new_board 

def isEmpty?(spot)
  spot == EMPTY
end 

def available_moves?(game_board) 
  game_board.each do |row|
    row.each do |spot|
      return true if isEmpty?(spot) 
    end
  end
  false  
end

=begin
[1] [2] [3] [0]
[4] [5] [6] [1]
[7] [8] [9] [2]
available_moves = [1, 2, 3, 4, 5, 6, 7, 8, 9]
or [0,1], [0,2], [0,3], [1, 0], [1, 1], [1, 2], ... 
or {row: [0, 1, 2, n], col: [0, 1, 2, n]}
Trade offs? --> 

Row/Col appraoch and nested arrays probably more scalable, but requires more iterations. 
Assign the available moves to 1..9 symbolically? Hardcoded and less flexible, but faster development. 
--> Let's go with that. 
=end 

moves = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
moves_to_board_map = {
  '1': game_board[0][0]
  '2': game_board[0][1]
  '3': game_board[0][2]
  '4': game_board[1][0]
  '5': game_board[1][1]
  '6': game_board[1][2]
  '7': game_board[2][0]
  '8': game_board[2][1]
  '9': game_board[2][2]
}

def get_available_moves(game_board) 
  return # ???
end 

def valid_move?(position) 
  return true if moves.include?(position)
  false 
end 

def get_player_move(available_spots) 
  # Ask the user to make a move (i.e. 1, 2, 3, ...) 
  prompt "Please select where on the board to make your move: e.g. 1 for the first cell" 
  position = gets.chomp.to_i.to_s
  break position if valid_move?(position)
  prompt "That isn't a valid move. Please choose an empty spot." 
  # Display valid moves. 
end 

# Side-effect, alter the game-board, no return 
def make_player_move(player_char, available_spots) 
  # Display the available spots 
  print moves 
  user_move = get_user_move
  # Translate move to board position 
  board_position = moves_to_board_map[user_move]
  board_position = player_char
  # Remove the move from the available spots/moves
  nil 
end 

# Maybe implement optimal algorithm for Tic-Tac-Toe later. 
def make_move_computer(computer_char, available_spots) 
  # Randomly select a spot that's available. 
  # Translate to board position. 
  # Make the move. 
  # Remove move from the available spots 
  nil 
end 

winner = nil 
while available_moves?(game_board) 
  # Get the available spots 
  available_spots = get_available_moves
  # Display the available moves. 
  
  make_move_player(first_player, available_spots)
  # BREAK SET winner = first_player IF get_gameboard_status 
  # Print the current board. 
  make_move_computer(second_player, available_spots) 
  # BREAK SET winner = second_player IF get_gameboard_status
end 

# DISPLAY the winner. 
prompt "The winner is #{winner}!" 
```

# Want-to-dos

- [ ] Add personalization by getting user's name
   -  [ ] Display the user's name when asking user to make move. 
   -  [ ] Display user's name at end of main loop when displaying results. 
   -  [ ] Display user's name when saying good-bye.
   -  [ ] Display user's name when saying hello. 
- [ ] Before submitting for code review, ensure there are no rubocop errors. 
  - Uncheck this box any time new changes are checked in. 
- [ ] 
