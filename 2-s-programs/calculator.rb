require 'yaml'

MESSAGES = YAML.load_file('messages.yml')
# This calculator program supports English, 'en'
# and Spanish, 'es'.

LANGUAGE = 'en'

# Methods

def messages(message, lang=LANGUAGE)
  MESSAGES[lang][message]
end

def prompt(message)
  puts "=> #{message}\n\n"
end

# See notes-and-misc/number_validator.rb for PEDAC approach and test cases.
def valid_number?(input)
  input = input.to_s
  integer?(input) || float?(input)
end

# Integers can have 0 or 1 plus or minus. 
# Integers must have 1+ digits with no other characters.
def integer?(input)
  /^[-+]?\d+$/.match(input)
end

# Floats must have a decimal point with at least one number
# on either side of the decimal.
def float?(input)
  /^[-|+]?\d*\.\d*$/.match(input) &&
    # Ensure "+." or "-." is not considered a float.
    !/^[-|+]?\.$/.match(input)
end

def get_valid_number(request_num)
  num = ""
  loop do
    prompt messages(request_num)
    num = gets.chomp

    if valid_number?(num)
      break
    else
      prompt messages("not_valid_number")
    end
  end
  num
end

def any_are_floats(*nums)
  nums.each { |num| return true if float?(num) }
  false
end

def operation_to_message(op)
  case op
  when "1"
    messages("adding")
  when "2"
    messages("subtracting")
  when "3"
    messages("multiplying")
  when "4"
    messages("dividing")
  end
end

def calculate(num1, op, num2)
  case op
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

# Rounding floats improves user experience
# e.g. '42.17' instead of '42.17238123803'
def round_if_float(result, precision=2)
  return result.round(precision) if float?(result.to_s)
  result
end

# MAIN program

prompt messages("welcome")
prompt messages("name")

name = ""
loop do
  name = gets.chomp
  if name.empty?
    prompt messages("valid_name")
  else
    break
  end
end

prompt "#{messages('greet')} #{name}!"

loop do # main loop
  number1 = get_valid_number("first_num")
  number2 = get_valid_number("second_num")

  prompt messages('operator_prompt')
  operator = ""
  loop do
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt messages("choices")
    end
  end

  prompt "#{operation_to_message(operator)} #{messages('two_numbers')}"
  if any_are_floats(number1, number2)
    number1 = number1.to_f
    number2 = number2.to_f
  else
    number1 = number1.to_i
    number2 = number2.to_i
  end

  result = calculate(number1, operator, number2)

  prompt "#{messages('result_is')} #{round_if_float(result)}"
  prompt messages("calculate_again")
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end

prompt messages("good_bye")
