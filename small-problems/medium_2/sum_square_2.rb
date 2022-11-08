=begin
Sum Square - Square Sum

Write a method that computes the difference between the square of the sum of the first n positive integers and the sum of the squares of the first n positive integers.

I - Integer
O - Integer
R:
- Return the difference between:
  - Square of the sum of the first n positive integers
  - Sum of the squares of the first n positive integers.

D:
- Array

Algo:
1. Get the sum of the first n integers.
2. Get the squares of the first n integers.
3. Return the difference between the squared sum and the summed squares.

=end

def sum_square_difference(num)
  sum = 1.upto(num).sum

  squares = 1.upto(num).map {|int| int ** 2 }

  sum ** 2 - squares.sum
end

sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
sum_square_difference(10) == 2640
sum_square_difference(1) == 0
sum_square_difference(100) == 25164150