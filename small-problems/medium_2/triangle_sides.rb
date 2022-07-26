=begin
Input: Three numbers
Output: Symbol
Requirements:
- Return :invalid if
  - any sides are 0 or less.
  - The longest side is longer than both of the shortest sidies together
- Return :equilateral, :isosceles, or :scalene depending on the lengths.

Data Structure?
- Array

Algorithm:
Store the sides in a list.
Find the longest side.
Return :invalid if the longest side is greater than the
sum of the smaller sides or if any side is 0 or less.

If all three sides are equal then return equilateral
If no sides are equal, then return scalene
Otherwise return isosceles.

=end

def triangle(side1, side2, side3)
  sides = [side1, side2, side3].sort

  # return :invalid unless sides.all? { |side| side > 0 }
  return :invalid unless sides[0, 2].sum > sides.max

  case sides.uniq.size
  when 1 then :equilateral
  when 2 then :isosceles
  when 3 then :scalene
  end
end

p triangle(3, 3, 3)   == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5)   == :scalene
p triangle(0, 3, 3)   == :invalid
p triangle(3, 1, 1)   == :invalid
