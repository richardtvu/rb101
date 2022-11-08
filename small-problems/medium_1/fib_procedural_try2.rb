# Fibonacci Numbers (Procedural)
# https://launchschool.com/exercises/336d2612

=begin
Write a non-recursive FIbonacci method.

P:
I - Integer
O - Integer
R:
- Do not use recursion.

Examples:
fibonacci(20) == 6765
fibonacci(100) == 354224848179261915075
fibonacci(100_001) # => 4202692702.....8285979669707537501

Data Structure:
- Array (memoization)
- Three Integers (just update these with each iteration)

Algorithm:
- If the number is less than or equal to 2, return 1.
- Subtract 2 from the number.
- Repeat n-2 times:
  - Sum the last two Fibonacci numbers calculated.
  - Remember the current sum.
  - Remember the second-to-last Fibonacci number.
- Return the sum.

=end

def fibonacci(num)
  return 1 if num <= 2

  curr_fib_num = 1
  prev_fib_num = 1
  sum = 0

  (num - 2).times do
    sum = curr_fib_num + prev_fib_num

    prev_fib_num = curr_fib_num
    curr_fib_num = sum
  end
  sum
end