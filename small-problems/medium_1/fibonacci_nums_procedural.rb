=begin 
Input: Integer (`n`-th Fibonacci number)
Output: Integer 
- Requirement: 
  - Use an iterative method, i.e. no recursion. 

  Fibonacci Sequence: 1, 1, 2, 3, 5, 8 ... 

Data Structure: 
- Array 
- Integers 

Algorithm: 
- Return 1 if n <= 2 
- Initialize n_minus_1 = 1 
- Initialize n_minus_2 = 1 
- Loop over numbers between 4 and n 
  - Initialize temp = n_minus_1
  - Increment n_minus_1 by n_minus_2
  - Set n_minus_2 to temp 
- Return sum of n_minus_1 + n_minus_2 

=end 

# Initial Solution
def fibonacci(n) 
  return 1 if n <=2 
  n_minus_1 = 1
  n_minus_2 = 1
  (4..n).each do |_| 
    temp = n_minus_1
    n_minus_1 += n_minus_2
    n_minus_2 = temp
  end 
  n_minus_1 + n_minus_2
end 

# Refactored for Readabiilty 
def fibonacci(nth) 
  second_to_last, last = [1, 1]
  3.upto(nth) do
    second_to_last, last = [last, last + second_to_last] 
  end 

  last 
end 

p fibonacci(2) 
p fibonacci(3) 
p fibonacci(4) 
p fibonacci(5)
p fibonacci(6) 
p fibonacci(100)  
p fibonacci(100_001)