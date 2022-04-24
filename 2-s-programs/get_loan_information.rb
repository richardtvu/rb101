# User Input Component of Mortgage Loan Calculator
# This program will help me separate and test out the user input and validation component from the rest of the program.

require 'yaml'
MESSAGES = YAML.load_file('messages.yml')

MIN_LOAN_AMOUNT = 0.0
MIN_ANNUAL_PERCENTAGE_RATE = 0.0
MIN_LOAN_DURATION_MONTHS = 1.0
YEARS_TO_MONTHS_MODIFIER = 12

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

def get_valid_number(request_message)
  num = ""
  loop do
    prompt request_message # messages(request_num)
    num = gets.chomp
    break if valid_number?(num)

    prompt messages("not_valid_number")
  end
  num.to_f
end

def get_months(years)
  years * YEARS_TO_MONTHS_MODIFIER
end

def get_decimal_rate(percentage)
  percentage / 100.0
end

# MAIN

# GET user input for the loan_amount, annual_percentage_rate, loan_duration_years. Candidate for refactoring.
# Validate each input:

loan_amount = ""
loop do
  # GET the loan_amount,
  loan_amount = get_valid_number("Please enter the loan amount.")
  break if loan_amount >= MIN_LOAN_AMOUNT
  prompt "Please provide a loan amount greater than or equal to $0."
end

annual_percentage_rate=""
loop do
  # GET the annual_percentage_rate, in % (e.g. 5 is 5%)
  annual_percentage_rate = get_valid_number("Please enter the Annual Percentage Rate (APR) in %, e.g. 5 is 5%.")
  break if annual_percentage_rate >= MIN_ANNUAL_PERCENTAGE_RATE
  prompt "Please provide an Annual Percentage Rate greater than or equal to 0."
end

# Convert annual_percentage_rate into decimal.
annual_percentage_rate = get_decimal_rate(annual_percentage_rate)

loan_duration_years = ""
loop do
  # GET loan_duration_years,
  loan_duration_years = get_valid_number("Please enter the duration of the loan in years, e.g. for a loan duration of 1 year 6 months, enter 1 for years and press enter. Then, press 6 when asked to enter months.")
  break if loan_duration_years >= 0
  prompt "The loan duration in years must be at least 0."
end

total_loan_duration_months = "" 
loop do
  # GET loan_duration_months
  months = get_valid_number("Please enter the duration of the loan in months. (e.g. if you had a loan duration of 1 year 6 months, enter 6 here.")
  total_loan_duration_months = months + get_months(loan_duration_years)
  break if total_loan_duration_months >= MIN_LOAN_DURATION_MONTHS
  prompt "The total loan duration must be at least 1 month."
end


# # At this point, we've a valid loan: consisting of loan_amount, annual_percentage_rate, loan_duration_years, loan_duration_months.


monthly_interest_rate = annual_percentage_rate/12.0
loan = {}
loan[:loan_amount] = loan_amount
loan[:monthly_interest_rate] = monthly_interest_rate
loan[:total_loan_duration_months] = total_loan_duration_months


# Output hash
loan.each do | key, value |
  puts "#{key} => #{value}"
end

monthly_payment_modifier = monthly_interest_rate / (1 - (1 + monthly_interest_rate)**(-total_loan_duration_months))
monthly_payment = loan_amount * monthly_payment_modifier

puts monthly_payment