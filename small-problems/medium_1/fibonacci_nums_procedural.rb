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

# Refactored for Readabiilty based on LS solution and Xulln's solution. 
def fibonacci(nth) 
  prev, curr = [1, 1]
  3.upto(nth) do
    prev, curr = [curr, curr + prev] 
  end 

  curr 
end 

# Refactored again based on Ned S.'s solution: 
def fibonacci(nth) 
  last_two = [1, 1]
  3.upto(nth) do
    last_two = [last_two.last, last_two.sum] 
  end 

  last_two.last 
end 

# Aaron T. 's Fast Doubling Algo 
def fibonacci_fast_doubling(n) 
  return 1 if n <= 2

  nums = []
  while n > 0 
    nums << n 
    n /= 2
  end 

  a = 0 
  b = 1 

  until nums.empty? 
    n = nums.pop 
    c = a * ((b * 2) - a) 
    d = a * a + b * b 
    if n.odd? 
      a = d
      b = c + d 
    else 
      a = c 
      b = d 
    end 
  end 
  a 
end 


p fibonacci(2) 
p fibonacci(3) 
p fibonacci(4) 
p fibonacci(5)
p fibonacci(6) 
p fibonacci(100)  
p fibonacci(100_001)