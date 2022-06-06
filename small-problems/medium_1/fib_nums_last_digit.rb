# Aaron T. 's Fast Doubling Algo 
def fibonacci(n) 
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
    d = a*a + b*b 
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



def fibonacci_last(nth) 
  fibonacci(nth).to_s[-1]
end 

def fibonacci_last(nth) 
  last_2 = [1,1]
  3.upto(nth) do 
    last_2 = [last_2.last, (last_2.first + last_2.last) % 10]
  end 

  last_2.last 
end 

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123_456_789) # -> 4
p fibonacci_last(123_456_789_987_745) 