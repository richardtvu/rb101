# Mortgage Loan Calculator

require 'yaml'
MESSAGES = YAML.load_file('messages_loan_calculator.yml')

# This program supports English, 'en', for now.
LANGUAGE = 'en'

MIN_AMOUNT = 0.0
MIN_TOTAL_DURATION_MONTHS = 1.0
MONTHS_IN_YEAR = 12

# Methods

def messages(message, lang = LANGUAGE)
  MESSAGES[lang][message]
end

def prompt(message)
  puts "=> #{message}\n\n"
end

def get_name
  loop do
    name = gets.chomp
    if name.empty?
      prompt messages('valid_name')
    else
      break name
    end
  end
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

# Enhance flexibility of user inputs. Accepts string and
# returns string without commas,underscores, %, or $.
def sanitize_num(number)
  number.gsub(/[,_$%]/, '')
end

def get_valid_number(amt_type, explanation = '')
  loop do
    request = "#{messages('request')} #{messages(amt_type)}"

    prompt "#{request}#{messages(explanation)}"
    num = sanitize_num(gets.chomp)
    if valid_number?(num)
      num = num.to_f
      break num if num >= MIN_AMOUNT
    end

    display_error_message(amt_type)
  end
end

def display_error_message(amt_type)
  # Error Messages
  min_amt = if amt_type == 'loan_dur_mo'
              '1 ' + messages('mo')
            else
              MIN_AMOUNT
            end
  prompt messages('please_enter') +
         "#{messages(amt_type)}" \
         "#{messages('greater_than')} #{min_amt}."
end

def get_monthly_rate_decimal
  annual_percentage_rate = get_valid_number('apr', 'apr_explanation')
  annual_percentage_rate / MONTHS_IN_YEAR / 100.0
end

def to_percent(decimal_num)
  decimal_num * 100
end

def get_total_dur_mos
  years = get_valid_number('loan_dur_yr', 'dur_yr_explanation')
  months = get_valid_number('loan_dur_mo', 'dur_mo_explanation')
  months + (years * MONTHS_IN_YEAR)
end

# Monthly loan payment.
def get_mo_payment(loan_amt, mo_int_rate, total_dur_mos)
  int_rate_mod = 1 - ((1 + mo_int_rate)**-total_dur_mos)
  mo_pay_mod = mo_int_rate / int_rate_mod
  loan_amt * mo_pay_mod
end

def format_num(num, precision = 2)
  format("%.#{precision}f", num.round(precision))
end

# MAIN

prompt messages('welcome')
prompt messages('name')

name = get_name
prompt "#{messages('greet')} #{name}!"

loop do # main loop
  loan_amt = get_valid_number('loan_amount')
  monthly_interest_rate_decimal = get_monthly_rate_decimal
  total_dur_mos = get_total_dur_mos

  monthly_payment = get_mo_payment(
    loan_amt,
    monthly_interest_rate_decimal,
    total_dur_mos
  )

  # Format results
  monthly_interest_rate = to_percent(monthly_interest_rate_decimal)

  monthly_payment = messages('currency') + format_num(monthly_payment)
  monthly_interest_rate = format_num(monthly_interest_rate)
  total_dur_mos = format_num(total_dur_mos)

  # DISPLAY results.

  puts ''
  prompt('Results')
  prompt('-------')
  prompt("Monthly Payment:          #{monthly_payment}")
  prompt("Monthly Interest Rate:    #{monthly_interest_rate}%")
  prompt("Loan Duration in Months:  #{total_dur_mos}")

  prompt messages('calculate_again')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt messages('good_bye')
