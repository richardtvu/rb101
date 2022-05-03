=begin 
How do I want to represent the game board? 

  2D array 
  [ 
     [ ] [ ] [ ] 
    ,[ ] [ ] [ ] 
    ,[ ] [ ] [ ] 
  ] 

=end 

def get_new_board(width = 3, height=3)
  board = [
    ['_'] * width
  ] * height
end 

def display_board(board) 
  board.each {|row| p row  }
end 

board = get_new_board

# Randomly fill board 
  board = board.map do |row|  
    row.map do |cell|         
      cell = ['x', 'o'].sample
    end                       
  end                         



string = <<~MSG
|#{board[0][0]}|#{board[0][1]}|#{board[0][2]}|
|#{board[1][0]}|#{board[1][1]}|#{board[1][2]}|
|#{board[2][0]}|#{board[2][1]}|#{board[2][2]}| 
MSG

puts string 