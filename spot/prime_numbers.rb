# Prime Numbers 
=begin

1. Given an integer representing a number, return a boolean indicating whether the integer is prime. 
2. Given an integer, n, calculate the set of prime numbers from 2 ...n. 
3. Given an integer a list of integers, transform the integers into their closest primes. 

- Prime = Any # > 1 that can only be divided by itself or 1. 
=end 


PRIMES = %w(2	3	5	7	11	13	17	19	23	29	31	37	41	43	47	53	59	61	67 71).map(&:to_i)

NONPRIMES = [0, 1, 4, 6, 8, 9, 10, 12, 14, 15, 16, 18, 20, 21, 22, 24, 25, 26, 27, 28, 30, 32, 33, 34, 35, 36, 38, 39, 40, 42, 44, 45, 46, 48, 49, 50, 51, 52, 54, 55, 56, 57, 58, 60, 62, 63]

# =====================================================================
# 1. Given an integer representing a number, return a boolean 
# indicating whether the integer is prime. 
# =====================================================================

def is_prime?(num) 
  return false unless num > 1     # Primes must be greater than 1. 
  for divisor in (2..num-1)
    return false if num % divisor == 0 
  end 
  true 
end 

# def test_is_prime
#   PRIMES.each { |prime| return false if !is_prime?(prime) }
#   NONPRIMES.each { |nonprime| return false if is_prime?(nonprime)}
#   true 
# end 

# puts test_is_prime ? "Passed" : "Failed" 

# =====================================================================
# 2. Given an integer, n, calculate the set of prime numbers from 2 ...n
# - Include the ability to get the next larger prime #. 
# ===================================================================== 

def set_primes(n, include_next_larger_prime = false) 
  primes = (2..n).select { |num| is_prime?(num)}

  n += 1 until is_prime?(n) if include_next_larger_prime == :include_larger_prime
  primes << n

  primes.uniq
end 

# Tests 
# p set_primes(PRIMES.last) == PRIMES
# p set_primes(PRIMES.last, :include_larger_prime) #== PRIMES


# =====================================================================
# 3. Given a list of integers, return a list of the same size with the
# integers transformed into the nearest prime number. If the integer is 
# equidistant between two primes, transform the element into the greater
# prime number. 
# ===================================================================== 

# Helper methods 
def bigger_and_lower_primes(num) 
  primes = set_primes(num, :include_larger_prime) 
  return [num] if primes.last == num 
  return primes[-2..-1]
end 

def closer_num(num, first_num, second_num) 
  small_num, big_num = [first_num,second_num].minmax 
  big_diff = big_num - num 
  small_diff = (small_num - num).abs 
  big_diff <= small_diff ? big_num : small_num
end 

def closest_prime?(num) 
  return 2 if num <= 1
  baby_prime, papa_prime = bigger_and_lower_primes(num) 
  return baby_prime if papa_prime == nil 
  return closer_num(num, baby_prime, papa_prime)
end 


# # Test For Method 
# TESTS = {-1 => 2, 2 => 2, 3 => 3, 4 => 5, 6 => 7, 26 => 29, 25 => 23, 45 => 47, 44 => 43}

# def test_closest_prime
#   TESTS.each do  |key,  val| 
#     p "Key: #{key}, Expected: #{val}, Got: #{closest_prime?(key)}"
#     return false if TESTS[key] != closest_prime?(key)
#   end
#   true 
# end 

# p test_closest_prime

# Solution 
def closest_primes(arr) 
  arr.map { |num| closest_prime?(num)}
end 

p closest_primes([-1, 3, 4, 9,  8, 14, 15, 16, 42, 41, 39, 38]) ==  
                  [2, 3, 5, 11, 7, 13, 17, 17, 43, 41, 41, 37]

p closest_primes([1,2,3,4,5,6,7,8,9, 10]) == 
                 [2,2,3,5,5,7,7,7,11,11]

    