require 'yaml'

MESSAGES = YAML.load_file('messages.yml')

def messages(message, lang='en')
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
  number1 = ""
  loop do
    prompt messages("first_num")
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      prompt messages("not_valid_number")
    end
  end

  number2 = ""
  loop do
    prompt messages("second_num")
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      prompt messages("not_valid_number")
    end
  end

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
