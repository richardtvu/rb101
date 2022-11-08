=begin

Compute the last digit of the nth Fibonacci number.

Examples:
fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
fibonacci_last(123456789) # -> 4

Data Structure:
- Array (to store the first 60 occurrences of the Fibonacci sequence)
- Integer... to determine which index?

Algorithm:
- Given a number.
- Calculate the first 60 Fib numbers.
- Get the remainder of dividing input number by 60.
- Get the remainder-th number in the list of 60 Fib numbers.
- Return the last digit of this number.

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

LAST_DIGIT_FIBONACCI_NUMS = 60.times.to_a.map do |idx|
  num = idx + 1
  fibonacci(num).digits[0]
end.freeze

def fibonacci_last(num)
  nth_fib_num = num % 60
  idx = nth_fib_num - 1

  p LAST_DIGIT_FIBONACCI_NUMS[idx]
end

fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
fibonacci_last(123_456_789) # -> 4
