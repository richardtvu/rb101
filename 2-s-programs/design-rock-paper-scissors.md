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

... Get the user's char choice 