# User Input Component of Mortgage Loan Calculator
# This program will help me separate and test out the user input and validation component from the rest of the program.

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

def get_monthly_rate(annual_percentage_rate)
  annual_percentage_rate / MONTHS_IN_YEAR / 100.0
end

# MAIN

# GET user input for the loan_amount, annual_percentage_rate, loan_duration_years. Candidate for refactoring.
# Validate each input:

loan_amount = get_valid_number("loan_msg", "loan_err_msg")

# GET the annual_percentage_rate, in % (e.g. 5 is 5%)
annual_percentage_rate = get_valid_number("apr_msg", "apr_err_msg")

# Convert annual_percentage_rate into decimal.
monthly_interest_rate = get_monthly_rate(annual_percentage_rate)

def get_total_duration_months
  years = get_valid_number("loan_yr_msg", "yr_err_msg")
  months = get_valid_number("loan_mo_msg", "mo_err_msg")
  months + years * MONTHS_IN_YEAR
end 

total_duration_months = get_total_duration_months


# # At this point, we've a valid loan: consisting of loan_amount, annual_percentage_rate, loan_duration_years, loan_duration_months.

loan = {}
loan[:loan_amount] = loan_amount
loan[:monthly_interest_rate] = monthly_interest_rate
loan[:total_duration_months] = total_duration_months

# Output hash
loan.each do |key, value|
  puts "#{key} => #{value}"
end

interest_rate_mod = 1 - (1 + monthly_interest_rate)**(-total_duration_months)
monthly_payment_modifier = monthly_interest_rate / interest_rate_mod
monthly_payment = loan_amount * monthly_payment_modifier

puts monthly_payment

# NEXT STEP... is to Refactor the get loops for getting the loan amount, monthly interest rate, and total loan duration. ....
# DONE is better than perfect.
# Remove the hash.
