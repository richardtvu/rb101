require 'yaml'

MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message, _language = 'en')
  puts "=> #{message}"
end

# See notes-and-misc/number_validator.rb for PEDAC approach and test cases.
def valid_number?(input)
  input = input.to_s
  integer?(input) || float?(input)
end

def integer?(input)
  /^[-+]?\d+$/.match(input)
end

def float?(input)
  /^[-|+]?\d*\.\d*$/.match(input)
end

def any_are_floats(*nums)
  nums.each { |num| return true if float?(num) }
  false
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

prompt MESSAGES["welcome"]
prompt MESSAGES["name"]

name = ""
loop do
  name = gets.chomp
  if name.empty?
    prompt MESSAGES["valid_name"]
  else
    break
  end
end

prompt "#{MESSAGES['greet']} #{name}!"

loop do # main loop
  number1 = ""
  loop do
    prompt MESSAGES["first_num"]
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      prompt MESSAGES["not_valid_number"]
    end
  end

  number2 = ""
  loop do
    prompt MESSAGES["second_num"]
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      prompt MESSAGES["not_valid_number"]
    end
  end

  prompt MESSAGES['operator_prompt']

  operator = ""
  loop do
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt MESSAGES["choices"]
    end
  end

  prompt "#{operation_to_message(operator)} #{MESSAGES['two_numbers']}"

  if any_are_floats(number1, number2)
    number1 = number1.to_f
    number2 = number2.to_f
  else
    number1 = number1.to_i
    number2 = number2.to_i
  end

  result = case operator
           when "1"
             number1 + number2
           when "2"
             number1 - number2
           when "3"
             number1 * number2
           when "4"
             number1.to_f / number2.to_f
           end

  prompt "#{MESSAGES['result_is']} #{result}"
  prompt MESSAGES["calculate_again"]
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end

prompt MESSAGES["good_bye"]
