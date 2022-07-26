=begin

- Input: 2 integers (starting num, ending num)
- Output: String (comma delimited)
- Requirements:
  - The output string will be the numbers in the range from the starting num to the ending num, inclusive*.
  - Exceptions:
    - A number divisible by 3 and 5 will be replaced with "FizzBuzz.
    - A number divisible by 3 will be "Fizz"
    - A number divisible by 5 will be "Buzz".

Data Structures?
- Array to store answers?

Algorithrm

Initialize array to store the nums.
Iterate through the numbers from the begin_num to the end_num.
- if number is divisible by 3 and 5, then append "FizzBuzz"
- else if number is divisible by 3, then append "Fizz"
- else if number is divisible by 5, then append "Buzz"
- else append the number.
Combine the elements of array with , to delimit.
Print result.
=end

def divisible?(num, *divisors)
  divisors.all? { |divisor| num % divisor == 0 }
end

def fizzbuzz(alpha, omega)
  fizzlin_buzzlin_arr = (alpha..omega).map do |num|
    if    divisible?(num, 3, 5)  then 'FizzBuzz'
    elsif divisible?(num, 3)     then 'Fizz'
    elsif divisible?(num, 5)     then 'Buzz'
    else
      num
    end
  end

  puts fizzlin_buzzlin_arr.join(', ')
end

fizzbuzz(1, 15)
