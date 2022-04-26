# Mortgage Loan Calculator
# What components do I want to test first? I'd like to test the mortgage calculations.

# SET country = 'us' (potential for internationalizing calculator)

# Constants, based on Calculator.net's Loan Calculator

MIN_LOAN_AMOUNT = 0
MIN_ANNUAL_PERCENTAGE_RATE = 0
MIN_LOAN_DURATION_MONTHS = 1
PRECISION = 2 # 2 decimal places, e.g. "$839.24".
CURRENCY = '$'

# Assume inputs have been validated.
# Given:
#   the total loan amount,
#   Annual Percentage Rate (APR),
#   loan duration in years and
#   months,
# This method shall return as a hash.
#   Monthly payment
#   Monthly interest rate
#   Loan duration in months
def calculate_payment_plan(_loan_amount, _annual_percentage_rate, _loan_duration_years, loan_duration_months)
  monthly_payment = ''
  monthly_interest_rate = ''
  loan_duration_months = MIN_LOAN_DURATION_MONTHS

  payment_plan = Hash.new
  payment_plan[:monthly_payment] = monthly_payment
  payment_plan[:monthly_interest_rate] = monthly_interest_rate
  payment_plan[:loan_duration_months] = loan_duration_months
  payment_plan
end

# Accepts the :monthly_payment, :monthly_interest_rate, and :loan_duration_months.
# Need to find a way to return with 2 decimal places.
def set_expected_payment_plan(monthly_payment, monthly_interest_rate, loan_duration_months)
  expected_payment_plan = Hash.new
  expected_payment_plan[:monthly_payment] = monthly_payment
  expected_payment_plan[:monthly_interest_rate] = monthly_interest_rate
  expected_payment_plan[:loan_duration_months] = loan_duration_months
  expected_payment_plan
end

p set_expected_payment_plan(100_000, 1, 1)

# Get the loan information.
# Create a hash of loan information, with their respective expected payment plans.
# Iterate through each loan and then compare the expected payment plans with the actual payment plans produced by the calculate_payment_plan.

# Accept a hash containing the annual loan information.
#

def test_calculate_payment_plan(expected_payment_plan, _loan)
  actual_payment_plan

  return true if expected_payment_plan == actual_payment_plan
  false
end
