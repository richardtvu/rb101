=begin
Right Triangles

Write a method that takes a positive integer, n, as an argument, and displays a right triangle whose sides each have n stars. The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, and the other end at the upper-right.

Input: Integer (n)
Output: Right Triangle
- Requirements:
  - The triangle will be a right triangle.
  - The sides must have `n` stars.
  - The diagonal goes from lower-left to upper-right.

Examples:
  - 1 => *
  - 2 =>
         *
        **

Data Structures/Algos:
- # for number of spaces

Iterate from 1 to n
  - Print stars justified to the right

=end

# Initial Solution
def triangle(n)
  (1..n).each { |num| puts ('*' * num).rjust(n) }
end

# Further Exploration - Upside Down

def justify(line, direction, spaces)
  case direction
  when :left then line.ljust(spaces)
  else            line.rjust(spaces) end
end

def triangle_upside_up(n, hor_dir = :right)
  (1..n).each do |num_stars|
    line = '*' * num_stars
    puts justify(line, hor_dir, n)
  end
end

def triangle_upside_down(n, hor_dir = :right)
  num_stars = n
  until num_stars == 0
    line = '*' * num_stars
    puts justify(line, hor_dir, n)
    num_stars -= 1
  end
end

def triangle(n, hor_dir = :right, upside = :up)
  case upside
  when :up then triangle_upside_up(n, hor_dir)
  else          triangle_upside_down(n, hor_dir)
  end
end

# Test Cases

triangle(5)
triangle(9)
triangle(5, :left)
triangle(9, :left)
triangle(5, :left, :down)
triangle(9, :left, :down)
triangle(5, :right, :down)
triangle(9, :right, :down)

# Refactored based on Hunter Amin's Solution
def triangle(n, base_corner = :bottom_right)
  stars = Array.new(n) { |i| ('*' * (i + 1)).rjust(n) }
  case base_corner
  when :bottom_right then puts stars
  when :bottom_left  then puts stars.map(&:reverse)
  when :top_left     then puts stars.map(&:reverse).reverse
  when :top_right    then puts stars.reverse
  end
end

triangle(5)
triangle(5, :top_right)
triangle(5, :bottom_left)
triangle(5, :top_left)

triangle(9)
triangle(9, :top_right)
triangle(9, :bottom_left)
triangle(9, :top_left)
