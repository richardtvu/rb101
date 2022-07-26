# Fibonnaci Num Loc By Length
=begin
https://launchschool.com/exercises/1ba53710

Fib Seq: 1, 1, 2, 3, 5 ...
- The first 2 numbers are 1.
- Each subsequent number is the sum of the last two numbers.

Memo, array, dp?

- Input: Integer (length of fibonnaci number)
- Output: Integer (index of 1st fib num with given length)
- Requirements:
  - input, n >= 2.

How would I calculate a fibonnaci number that is 10_000 digits in size ... while keeping track of the index?

Because the input # is a minimum of 2, I can start my calculations off at the fib numbers 8 and 13, which would allow me to calculate fib numbers later on in the seq.
fib #: 8, 13
size:  1, 2
index: 6, 7, ...

fib_one = 8
fib_two = 13
index_fib_two = 7
size_fib_two = 2

fib_one, fib_two = fib_two, (fib_one+fib_two)

Given an integer, size (of the fibonacci number)
Initialize fib_one to 8.
Initialize fib_two to 13.
Initialize index_fib_two to 7.
Initialize size_fib_two to 2.

WHILE the size_fib_two < size
  Get fib_one and fib_two
  Increment index_fib_two
  Get the size of fib_two
  If size_fib_two is equal to size, exit the loop
END

Return the index_fib_two
=end

# Initial Solution
def find_fibonacci_index_by_length(desired_fib_size)
  fib_one = 8
  fib_two = 13
  index_fib_two = 7
  size_fib_two = 2

  while size_fib_two < desired_fib_size
    index_fib_two += 1
    fib_one, fib_two = fib_two, (fib_one + fib_two)
    size_fib_two = fib_two.to_s.size
  end

  index_fib_two
end

p find_fibonacci_index_by_length(2) == 7 # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3)     == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10)    == 45
p find_fibonacci_index_by_length(100)   == 476
p find_fibonacci_index_by_length(1000)  == 4782
p find_fibonacci_index_by_length(10_000) == 47_847
