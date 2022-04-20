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
  message = case op
            when "1"
              messages("adding")
            when "2"
              messages("subtracting")
            when "3"
              messages("multiplying")
            when "4"
              messages("dividing")
            end
  message
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
  # loop do
  #   prompt messages("first_num")
  #   number1 = gets.chomp

  #   if valid_number?(number1)
  #     break
  #   else
  #     prompt messages("not_valid_number")
  #   end
  # end

  number2 = get_valid_number("second_num")
  # loop do
  #   prompt messages("second_num")
  #   number2 = gets.chomp

  #   if valid_number?(number2)
  #     break
  #   else
  #     prompt messages("not_valid_number")
  #   end
  # end

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

  prompt "#{messages('result_is')} #{result}"
  prompt messages("calculate_again")
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end

prompt messages("good_bye")
