# Mortgage Loan Calculator

require 'yaml'
MESSAGES = YAML.load_file('loan_calculator_messages.yml')

# This program supports English, 'en', for now.
LANGUAGE = 'en'

MIN_AMOUNT = 0.0
MIN_TOTAL_DURATION_MONTHS = 1.0
MONTHS_IN_YEAR = 12

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

# Enhance flexibility of user inputs. Accepts string and
# returns string without commas and underscores
def sanitize_num(number)
  number.gsub(/(,|_)/, '')
end

def get_valid_number(request_msg, error_msg)
  loop do
    prompt messages(request_msg)
    num = sanitize_num(gets.chomp)
    if valid_number?(num)
      num = num.to_f
      break num if num >= MIN_AMOUNT
    end
    prompt messages(error_msg)
  end
end

def get_monthly_rate
  annual_percentage_rate = get_valid_number("apr_msg", "apr_err_msg")
  annual_percentage_rate / MONTHS_IN_YEAR / 100.0
end

def get_total_dur_mos
  years = get_valid_number("loan_yr_msg", "yr_err_msg")
  months = get_valid_number("loan_mo_msg", "mo_err_msg")
  months + years * MONTHS_IN_YEAR
end

# Monthly loan payment. 
def get_mo_payment(loan_amt, mo_int_rate, total_dur_mos)
  int_rate_mod = 1 - (1 + mo_int_rate)**(-total_dur_mos)
  mo_pay_mod = mo_int_rate / int_rate_mod
  loan_amt * mo_pay_mod
end
# MAIN

loan_amt = get_valid_number("loan_msg", "loan_err_msg")
monthly_interest_rate = get_monthly_rate
total_dur_mos = get_total_dur_mos

monthly_payment = get_mo_payment(loan_amt, monthly_interest_rate, total_dur_mos)

# At this point, we've a valid loan: consisting of
# loan_amt, 
# annual_percentage_rate, 
# loan_duration_years, 
# loan_duration_months.

loan = {}
loan[:loan_amt] = loan_amt
loan[:mo_int_rate] = monthly_interest_rate
loan[:total_dur_mos] = total_dur_mos

# Output hash
loan.each do |key, value|
  puts "#{key} => #{value}"
end

# int_rate_mod =
#   1 -
#   (1 + monthly_interest_rate)**(-total_dur_mos)
# mo_pay_mod = monthly_interest_rate / int_rate_mod
# monthly_payment = loan_amt * mo_pay_mod

puts monthly_payment
