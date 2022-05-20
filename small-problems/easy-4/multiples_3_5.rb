=begin
Multiples of 3 and 5
https://launchschool.com/exercises/675bc8c9

# Problem 
- Input: Integer (max number >= 1)
- Output: Integer (sum)
- Requirements: 
  - Find multiples of 3 or 5 between 1 and a max. 
  - Return the sum of these multiples. 

- Implicit Requirements:
  - Include the input integer if the input integer is a multiple of 3 or 5. 
  - The multiples must be unique. 

- Questions: 
  - What do you return if the input integer is less than 3? 
    - Probably 0. 

# Examples 

multisum(3) == 3
multisum(5) == 8
multisum(10) == 33
multisum(1000) == 234168

# Data Structure
- Intermediate? Probably an array. Why?
    - It'll be easier to check whether the multiples are unique. 

# Algorithm

Hi-level algo(s) 
A. 
Find multiples of 3 up to the input integer. 
Find multiples of 5 up to the input integer. 
Get the unique multiples. 
Sum these multiples. 
Return the sum. 

B. 
Get multiples of 3 or 5 up to the input integer. 
Add to collection of multiples if unique. 
Sum the multiples. 
Return the sum. 

Lo-level algo(s) 
Find multiples
Given an integer, max. 
Initialize a local variable `multiples` to an empty array. 
Initialize `current_multiple` to the input multiple. 
While the current multiple  is less than or equal to the max
  Add the multiple to the `multiples` array. 
  Increment the current_multiple by passed in multiple. 
End 
Return multiples


# -------------------------------------- Code -------------------------------
=end

def find_multiples(multiple, max) 
  multiples = [] 
  current_multiple = multiple
  while current_multiple <= max 
    multiples << current_multiple 
    current_multiple += multiple
  end 
  multiples 
end 

# p find_multiples(3, 9)
# p find_multiples(5, 10) 

def multisum(max) 
  multiples_of_3 = find_multiples(3, max)
  multiples_of_5 = find_multiples(5, max)
  multiples = multiples_of_3 + multiples_of_5
  multiples.uniq.sum 
end 

p multisum(3)     #== 3
p multisum(5)     #== 8
p multisum(10)    #== 33
p multisum(1000)  #== 234168