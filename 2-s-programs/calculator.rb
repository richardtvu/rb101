puts "Calculator"

puts "First number?"
num1 = gets.chomp

puts "Second number?"
num2 = gets.chomp

puts "What operation would you like to perform?"
puts "1) add \n2) subtract \n3) multiply \n4) divide"
operator = gets.chomp

num1 = num1.to_i
num2 = num2.to_i

case (operator)
when "1"
  result = num1 + num2
when "2"
  result = num1 - num2
when "3"
  result = num1 * num2
when "4"
  result = num1.to_f / num2.to_f
else
  result = "Invalid operation. Input 1, 2, 3, or 4."
end

puts result
