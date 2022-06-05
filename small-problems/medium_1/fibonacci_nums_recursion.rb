=begin 
Fibonacci Nums (Recursion) 

Input: Integer, `n`
Output: Integer
Requirement:
- Output the fibonnaci number corresponding to the n-th place in the Fibonacci series. 
- The `n`-th Fib number is the sum of the Fib(n-1) and Fib(n-2) number. 
- The Fibonacci sequence starts off at 1, 1, 2, 3... 

Data Structure? 
- Integer 

Algo? 
Return 1 if n is 1 or 2 
Otherwise return the sum of the last and last last fibonacci number. 

=end 
def fibonacci(n) 
  return 1 if n <= 2 
  fibonacci(n-1) + fibonacci(n-2) 
end 


p fibonacci(1)  #== 1
p fibonacci(2)  #== 1
p fibonacci(3)  #== 2
p fibonacci(4)  #== 3
p fibonacci(5)  #== 5
p fibonacci(12) #== 144
p fibonacci(20) #== 6765
p fibonacci(50) #== 6765