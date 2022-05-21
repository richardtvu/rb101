# Running Totals 
=begin 
Problem:
- Input: Array (of integers)
- Outputs: Array (ints) 
- Requirement: 
  - Same # of elements 
  - Running total orginal array 

Data Structure: 
- Array 

Algorithm: 

sum 
create a new list of numbers
transform each element in numbers into the running total
return this new array 

=end 

def running_total(arr) 
  sum = 0 
  arr.map do | num | 
    sum += num 
  end 
end 

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []
