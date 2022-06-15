=begin

Input: Integers
Output: Symbol
Requirements:
- Given the angles of a triangle, return the kind of the triangle.
- The sum of the angles must add up to 180 to be a triangle.
- All sides must be greater than 0.

- A right triangle has a 90 degree angle.
- Acute triangle has all angles less than 90.
- Obtuse triangle has one angle greater than 90.

Data Structure:
- Array.

Algo:
- Get the list of angles.
- Return invalid if any angles are 0 or the sum of the angles isn't 180.

- If any angle is 90 then return right
- If any angle is greater than 90, reutrn obtuse
- Otherwise return acute

=end

def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]

  return :invalid unless angles.sum == 180 && angles.min > 0 

  case (angles.max)
  when 91.. then :obtuse
  when 90   then :right
  else           :acute
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid