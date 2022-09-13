=begin
Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as an argument to the method. You may assume that the argument will always be an odd integer.

I: Integer (odd number)
O: Strings displayed to the standard output
R:
- Input will always be an odd number.
- The diamond will have 4 points.
- The height and width will be n * in length.
- The diamond  must be centered vertically and horizontally.
- The first and last lines will always have 1 asterisk.
- Starting from the first line, the asterisks per line increases by 2 up until the center.
- Starting from the center to the end, the asterisks per line decreases by 2 down to 1.
DS:
- Array (1D or 2D for grid structure)
- Strings for printing each line.

Algorithm (alternative high-level algorithms)
- Split the diamond into a top and bottom triangle, with a center line.

- Split the diamond into a top triangle and a bottom triangle only.

- Envision a staircase. one up to... the top...down to the bottom, i.e. this is a giant triangle rotated 90 degrees when you take away the spaces.


             *
      *     ***
 *   ***   *****
*** ***** *******

Algorithm: Stairway to Heaven

Created the rotated triangle:
  Create an empty array
  Create and iterate over string of asterisks to
  Create and return the array of strings representing lines on the rotated triangle.

triangle_to_diamond:
- Pad each string in the rotated triangle with spaces on each side until each string is odd_num in length.
=end

def rotated_triangle(odd_num)
  arr_of_strs = []
  asterisks_str = "*" * odd_num
  last_index = odd_num -1

  0.upto(last_index).each do |index|
    arr_of_strs << asterisks_str[0..index] if index.even?
  end

  (last_index-2).downto(0).each do |index|
    arr_of_strs << asterisks_str[0..index] if index.even?
  end

  arr_of_strs
end

def triangle_to_diamond(rotated_triangle_arr,odd_num)
  rotated_triangle_arr.map do |str|
    str.center(odd_num)
  end
end

def diamond(odd_num)
  rotated_triangle_arr = rotated_triangle(odd_num)
  diamond = triangle_to_diamond(rotated_triangle_arr, odd_num)

  puts diamond
end