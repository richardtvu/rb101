require "./regex_number_validator.rb"

def prompt(msg)
  puts "=> #{msg}"
end

def get_valid_num(order)
  loop do
    prompt "#{order} number?"
    num = gets.chomp
    return num.to_i if Validator.number?(num)
    prompt "Invalid number. Try again"
  end
end

def get_operator(operator_prompt, valid_operators)
  loop do
    prompt(operator_prompt)
    operator = gets.chomp
    return operator if valid_operators.include?(operator)
    prompt("Invalid operation. Input 1, 2, 3, or 4.")
  end
end

def do_calculation(operator, num1, num2)
  case (operator)
  when "1"
    num1 + num2
  when "2"
    num1 - num2
  when "3"
    num1 * num2
  when "4"
    num1.to_f / num2.to_f
  end
end

def get_name(name)
  prompt "What's your name?"
  loop do
    name = gets.chomp
    return name unless name.empty?
    prompt "Input a valid name."
  end
end

def keep_going?
  prompt "Would you like to do another calculation?"
  prompt "(Y to calculate again)"
  again = gets.chomp.downcase
  return true if again.start_with?("y")
  false
end

def operation_to_message(operator)
  case (operator)
  when "1" then msg = "Adding"
  when "2" then msg = "Subtracting"
  when "3" then msg = "Multiplying"
  when "4" then msg = "Dividing"
  end
  msg
end

prompt "Calculator"
name = get_name(name)
prompt "Welcome #{name}!"

loop do
  num1 = get_valid_num("First")
  num2 = get_valid_num("Second")

  operator_prompt = <<-MSG
What operation would you like to perform? 
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG
  operator = get_operator(operator_prompt, %w(1 2 3 4))

  prompt "#{operation_to_message(operator)} the two numbers..."
  result = do_calculation(operator, num1, num2)
  prompt("Result: #{result}")
  break unless keep_going?
end

prompt("Bye bye!")
