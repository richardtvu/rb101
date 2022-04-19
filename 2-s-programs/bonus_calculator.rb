def prompt(message)
  puts "=> #{message}"
end

# See notes-and-misc/number_validator.rb for PEDAC approach and test cases. 
def valid_number?(input)
    # In case the input isn't already a string.
    input = input.to_s
    obj = /^[-|+]?\d*(\.?\d*)?$/.match(input) &&
          # Prevents '+' or '-' from returning false positive.
          !/^[-|+]+$/.match(input)
    obj ? true : false
end



def operation_to_message(op)
  message = case op
            when "1"
              "Adding"
            when "2"
              "Subtracting"
            when "3"
              "Multiplying"
            when "4"
              "Dividing"
            end
  message
end

prompt "Welcome to the Calculator!"
prompt "What's your name?"

name = ""
loop do
  name = gets.chomp
  if name.empty?
    prompt "Make sure to use a valid name."
  else
    break
  end
end

prompt "Hi #{name}!"

loop do # main loop
  number1 = ""
  loop do
    prompt "What's the first number?"
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      prompt("Hmm... that doesn't look like a valid number")
    end
  end

  number2 = ""
  loop do
    prompt "What's the second number?"
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      prompt("Hmm... that doesn't look like a valid number")
    end
  end

  operator_prompt = <<-MSG
  What operation would you like to perform? 
  1) add 
  2) subtract 
  3) multiply 
  4) divide
  MSG

  prompt(operator_prompt)

  operator = ""
  loop do
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3, or 4")
    end
  end

  prompt "#{operation_to_message(operator)} the two numbers ..."



  # What about when num1 or num2 are floats? 
  result = case operator
           when "1"
             number1.to_f + number2.to_i
           when "2"
             number1.to_i - number2.to_i
           when "3"
             number1.to_i * number2.to_i
           when "4"
             number1.to_f / number2.to_f
           end

  prompt "The result is #{result}"
  prompt "Do you want to perform another calculation? (Y to calculate again)"
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end

prompt "Thank you for using the calculator. Good bye!"
