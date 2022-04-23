# Assignment: Mortgage / Car Loan Calculator

## Problem 

- Inputs: 
  - loan amount
  - Annual Percentage Rate (APR) 
  - loan duration:
    - years
    - months 

- Outputs:
  - Monthly interest rate
  - Loan duration in months
  - Monthly payment 

- Rules/Requirements: 
  - ![formula as image](https://d1b1wr57ag5rdp.cloudfront.net/images/mortgage_calc_formula.png)
  - Formula in code: `m = p * (j / (1 - (1 + j)**(-n)))` 
  - Use explicit variable names, e.g.
    - `p` = `loan_amount`
    - `j` = `monthly_interest_rate`
    - `n` = `loan_duration_months`
  - Run code through rubocop. 

- Implicit Requirements Based on [calculator.net](https://www.calculator.net/loan-calculator.html?c2loanamount=100000&c2loanterm=10&c2loantermmonth=0&c2interestrate=6&c2compound=annually&x=66&y=11&type=2#intheend): 
  - The money amounts will be prefaced with a symbol, e.g. `$`. If time permits, I could internationalize the program to use country-specific currency symbols, e.g. `€`. 
  - The **monthly interest rate** is the **APR** divided by 12. 
  - The interest rate will be input as a percentage (i.e. 5 represents 5% APR). 
  - Minimum Loan Amount: $0
  - Minimum APR: 0%
  - Minimum loan term: 1 month 
  - The inputs will come from the user, so make sure to accept user input. 
  - Acceptable data types for input: integers or floats.
  - Precision: 2 decimal places, e.g. "$839.24".   
  - While the calculator is open, allow the user to calculating monthly payments (i.e. once done with one calculation ask the user if they want to calculate another)

- Questions: 
  - What kind of loan is given? 
    - Let's go with an **Amortized Loan**, which involves "paying back a fixed amount periodically" ([calculator.net](https://www.calculator.net/loan-calculator.html?c2loanamount=100000&c2loanterm=10&c2loantermmonth=0&c2interestrate=6&c2compound=annually&x=66&y=11&type=2#intheend)). 


## Examples

### Example #1 
- Inputs: 
  - loan amount: $100,000
  - Annual Percentage Rate (apr): 6% (0.06)
  - loan duration: 10 years, 0 months 

- Outputs:
  - Monthly payment: $1,110.21 
  - Monthly interest rate: 0.5% (0.05) 
  - Loan duration in months: 120

### Example #2

- Inputs: 
  - loan amount: $100,000
  - Annual Percentage Rate (apr): 12% (0.12)
  - loan duration: 0 years, 1 months

- Outputs:
  - Monthly payment: $101,000.00
  - Monthly interest rate: 1%
  - Loan duration in months: 1 
  
### Example #3

- Inputs: 
  - loan amount: $100,000
  - Annual Percentage Rate (apr): 12% (0.12)
  - loan duration: 1 years, 1 months

- Outputs: 
  - Monthly payment: $8,241.48
  - Monthly interest rate: 1%
  - Loan duration in months: 13

### Example #4: 

- Inputs: 
  - loan amount: $100,000
  - Annual Percentage Rate (apr): 12% (0.12)
  - loan duration: 0.123 years, 0 months

- Outputs: 
  - "Please provide a loan term greater than 1 month". 

### Example #5: 

- Inputs: 
  - loan amount: $100,000
  - Annual Percentage Rate (apr): 12% (0.12)
  - loan duration: 1 years, 0.01 months

- Outputs: 
  - Monthly payment: $8,877.91
  - Monthly interest rate: 1%
  - Loan duration in months: 12.01

## Data Structures

- Intermediaries? 
  - Variables or hash (key-value pairs). 
    - The hash would make it easier to display the outputs with a loop. The inputs make for natural key-value pairs and would allow for storing the loan information into a database later. 
    - Variables allow for simpler printing when only considering compounding monthly. 

- Choice: Variables for an MVP. 


## Scratch Pad? 
- Do I need iteration? What do I need to iterate over? Do I need multiple iterations?
  - I won't need to iteration to find the monthly payments or other information I need for the monthly payment formula. 

## Algorithm

```rb

# SET country = 'us' (potential for internationalizing calculator)

# SET MIN_LOAN_AMOUNT = 0 
# SET MIN_ANNUAL_PERCENTAGE_RATE = 0 
# SET MIN_LOAN_DURATION_MONTHS = 1


# GET user input for:
  # the loan_amount, 
    # check is a valid number (integer or float) 
    # validate loan_amount >= MIN_LOAN_AMOUNT 
  # annual_percentage_rate, in % (e.g. 5 is 5%)
    # check is a valid number (integer or float)
    # validate annual_percentage_rate >= MIN_ANNUAL_PERCENTAGE_RATE  
    # convert 
  # loan_duration_years, 
    # check is a valid number (integer or float)
    # validate loan_duration_years >= 0 
  # loan_duration_months 
    # check is a valid number (integer or float)
    # validate loan_duration_months >= 1


# DEFAULT compound_frequency to monthly, 12
  # Option to use YAML to store different compound rates, e.g.annually, semi-annually, quarterly 
  # Option to allow for different compound rates? 
  # e.g. SET compounding_interest_rate = annual_percentage_rate / compound_frequency  

# SET loan_duration_months += loan_duration_years 
# SET monthly_payment = '' 
# SET monthly_interest_Rate = annual_percentage_rate / 12  

# SET monthly_payment_modifier = (monthly_interest_rate / 
  # (1 - (1 + monthly_interest_rate)**(-loan_duration_months))
# SET monthly_payment = loan_amount * monthly_payment_modifier


# PRINT the following:
  # Monthly payment: monthly_payment 
  # Monthly interest rate: monthly_interest_rate
  # Loan duration in months: loan_duration_months 


## Code (with intent) 

```rb
def  