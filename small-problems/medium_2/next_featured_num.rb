=begin 
Input: Integer
Output: Integer 
Reqs: 
- Return value must be:
  - Odd 
  - Have unique digits 
  - Be divisible by 7.  
  - Greater than the input integer.
  - An error message if any of the above cannot be fulfilled. 

What's the largest featured number possible? 
- The largest featured num would use all digits from 0-9. 
- 9876543210 (if this were odd and divisible) - CAP. 
- Any integer with more than 10 digits CANNOT be a featured number. 

- For now, let's make the assumption that the largest featured number is 1_023_456_987. 
- Then, we can come back and determine the largest later. 


Data Structure:
- Array 

Algorithm: 
- Check each integer greater than the input integer. 
  - Return the first integer that is a featured number. 
=end 

# Why add 14? To preserve oddness. Adding 7 means making an odd number even. Odd + odd = even, e.g. 7 + 7 = 14. 

MAX_FEATURED_NUM = 9_876_543_201

# Initial Solution 
def featured_num?(num) 
  num.odd? && num.digits.uniq == num.digits && num % 7 == 0 
end 

def featured(number) 
  (number..).each do |num|
    return num if featured_num?(num) 
    break "There is no possible number that fulfills those requirements" if num >  MAX_FEATURED_NUM
  end 
end 

def featured(num) 
  num += 1 # To ensure return value is greater than input. 
  num += 1 until num.odd? && num % 7 == 0 

  while num < 987_654_213
    num.digits == num.digits.uniq ? (return num) : num += 14
  end 

  "There is no possible number that fulfills those requirements" 
end 

def featured(num) 
  num -= 1 
  num -= 1 until num.odd? && num % 7 == 0 
  loop do 
    return num if num.digits == num.digits.uniq 
    num -= 14
  end 
end 
  


# p featured(12)          #== 21
# p featured(20)          #== 21
# p featured(21)          #== 35
# p featured(997)         #== 1029
# p featured(1029)        #== 1043
# p featured(999_999)     #== 1_023_547
p featured(1_023_548)
p featured(999_999_987) #== 1_023_456_987
p featured(9_999_999_999)
# p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
