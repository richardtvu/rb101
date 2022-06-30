=begin
Sum Square - Square Sum

Input: Integer, `n`.
Output: Integer  (sum of squares) - (square of sums)
Requirements:
- Minimum? 1 probably.

Data Structure:
- Array

Algo:
- Given `n`, generate an array of integers from 1 to n, inclusive.
  [1, 2, 3]
- Get the sum of these integers. => 6
- Get the square of that sum, square sum. => 36
- Iterate over the array of integers.
  - Square each integer.
  => [1, 4, 9]
- Sum the integers in that array, sum square. => 14
- Subtract square_sum by sum_square. 36 - 14 => 22

=end

def sum_square_difference(num)
  first_n_integers = 1..num

  sum     = first_n_integers.sum
  squares = first_n_integers.map { |number| number**2 }

  sum**2 - squares.sum
end

p sum_square_difference(3)    == 22
p sum_square_difference(10)   == 2640
p sum_square_difference(1)    == 0
p sum_square_difference(100)  == 25164150
