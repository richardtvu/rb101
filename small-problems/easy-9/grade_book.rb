=begin

- Input: 3 nums
- Output: String
- Requirements:
  - Return letter grade associated with the average of the 3 nums.
  - No negative inputs or any greater than 100.

Data Structure?
- Array

Sum the numbers.
Divide by num of numbers.
Convert average to letter grade.
Return letter grade.

=end

# For the further exploration, just delete 100 in this GRADES hash to compute any number above 90 as an A.
GRADES = {
  A: (90..100).to_a,
  B: (80...90).to_a, # Note the `...` to exclude 90.
  C: (70...80).to_a,
  D: (60...70).to_a,
  F: (0o0...60).to_a
}

# Initial Solution
def get_grade(*points)
  avg = points.sum / points.size
  GRADES.each do |letter_grade, scores|
    return letter_grade.to_s if scores.include?(avg)
  end
end

def get_avg(points)
  points.sum / points.size
end

# Using find
def get_grade(*points)
  GRADES.find do |_, scores|
    scores.include?(get_avg(points))
  end[0].to_s
end

# Using select
def get_grade(*points)
  GRADES.select do |_, scores|
    scores.include?(get_avg(points))
  end.keys[0].to_s
end

p get_grade(95, 90, 93) # == "A"
p get_grade(50, 50, 95) == 'D'
