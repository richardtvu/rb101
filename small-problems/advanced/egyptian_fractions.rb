# https://launchschool.com/exercises/5f95d514

# given a rational number return an array of the denomonators of the eqyption fractions that sum up to the given rational number.

# PEDAC

# P:
# Input: Integer
# 2 methods
# One to egyptify
# One to un-egyptify
# Array.
# Every rational number will have at least one egymptian sum.

# Have a rational number variable so we can store our rational number.
# Array ...
# egyptian(Rational(127, 130))
# numerator always 1
# denominator at 1
# IF the egyptian fraction is greater than the input, then I don't append the fraction to the array.
# egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
# 1/1 + 1/2 + 1/3

# Initialize an sum to Rational(0)
# Initialize a denominators array to [].
# WHILE my sum is NOT equal to the rational number:
  # Get the current egyptian fraction(1/denominator)
  # Add the current egyptian fraction to the sum.
  # If the sum is greater than the rational number
    # Subtract the current egyptian fraction from the sum.
  # Else,
    # append the denominator to the array of denominators
  # Increment the denominator.
# Return the array of denominators.



# def egyptian(rational_num)
#   sum = Rational(0)
#   denominator = 1
#   denominator_arr = []

#   while sum != rational_num
#     egyptian_fraction = Rational(1, denominator)
#     sum += egyptian_fraction
#     if sum > rational_num
#       sum -= egyptian_fraction
#     else
#       denominator_arr << denominator
#     end
#     denominator += 1
#   end
#   return denominator_arr
# end

# def unegyptian(denominators)
#   denominators.map { |denominator| Rational(1, denominator) }.sum
# end



# p egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
# p egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
# p egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]
# p egyptian(Rational(127, 130)) == [2, 3, 7, 1365]


def unegyptian(denominators)
  denominators.map { |denominator| Rational(1, denominator) }.sum
end

def egyptian(rational)
  denominators = []
  denom = 1

  loop do
    break if rational == denominators.sum
    fraction = Rational(1, denom)

    if denominators.sum + fraction <= rational
      denominators << fraction
    end
    denom += 1
  end
  denominators.map(&:denominator)
end


p unegyptian(egyptian(Rational(1, 2))) == Rational(1,2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)


