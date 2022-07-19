=begin 
DS --> array of arrays 
also use array 

Algo: 

Given a 3x3 array... 
Initialize new_matrix 
Iterate over each column index from 0...n. 
  Initialize a `row` array to []. 
  Iterate over the row indices from 0...n. 
    Push matrix[column_index][row_index] to row. 
  End row index loop. 
  Push row to new matrix. 
End outer loop. 
New matrix 
=end 
def transpose(matrix) 
  new_matrix = [] 
  (0...matrix.size).each do | column_index | 
    row = [] 
    (0...matrix.size).each do |row_index| 
      row << matrix[row_index][column_index]
    end 
    new_matrix << row 
  end 

  new_matrix
end 

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

