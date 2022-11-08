# Fibonacci Sequence, Recursion

=begin
The first two Fibonacci numbers are 1 and 1. Each subsequent number is the sum of the previous two Fibonacci numbers.

F(1) = 1
F(2) = 1
F(n) = F(n - 1) + F(n - 2) where n > 2

Write a recursive method to determine the n-th Fibonacci number.

P:
I - Integer
O - Integer
R:
- The method will call itself at least once.
- Stop recursing when the method reaches a base case.
- The method uses the return value of invoking itself.

Examples
fibonacci(1) == 1
fibonacci(2) == 1
fibonacci(3) == 2
fibonacci(4) == 3
fibonacci(5) == 5
fibonacci(12) == 144
fibonacci(20) == 6765

Data Structure
- Two Integers will suffice.

Algorithm:
- Accept an integer.
- If the integer is 1 or 2, then return 1.
- Otherwise,
  - Get the sum of the (n-1th) and (n-2th) Fibonacci number.

=end

def fibonacci(num)
  if num <= 2
    return 1
  end

  fibonacci(num-1) + fibonacci(num-2)
end