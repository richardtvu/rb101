=begin
Suppose we're building a scientific calculator,
and we now need to account for inputs that include decimals.
How can we build a validating method, called number?,
to verify that only valid numbers -- integers or floats -- are entered?

Problem:
  Input: String
  Output: Boolean - True/fa lse

  Requirements:
    - A string that contains a valid integer or float will return true.
    - What's a valid integer or float?
      - A number that has either 0 or 1 `+` or `-` in the beginning.
      - A number with either 0 or 1 `.`
        - The `.` will be next to a number.

Examples:
- '+00.00' (is equivalent to 0.0)=> true
- '-00.' (is equivalent to 0.0) => true
- '-+0' => false
- '-.0' (is equivalent to 0.0) => true
- '+.123' => true
- '4.6' => true
- '4' => true
- '%2.1' => false
- '+000001.00000001' => true

Data Structures:
- Variable -> Regex?
- Or, we use arrays to store the chars.

Algorithm:
- If an input has:
  - 0 or 1 `-` followed by either:
    - 0 digits before a [.] and 1 or more digits without other symbols
    - 1+ digits
    - 1+ digits with a [.] and 0 or more digits without other symbols
  - THEN return true
- ELSE
  - Return false.

  - /^[-+]?\d*.?\d*$/

=end
class Validator
  def self.number?(input)
    # In case the input isn't already a string.
    input = input.to_s
    obj = /^[-|+]?\d*(\.?\d*)?$/.match(input) &&
          # Prevents '+' or '-' from returning false positive.
          !/^[-|+]+$/.match(input)
    obj ? true : false
  end
end

# Test Cases
def run_tests(inputs, expected_result = true)
  inputs.each { |input| p Validator.number?(input) == expected_result }
end

# Valid Inputs
valid_inputs = [
  '+00.00', # Ensure leading zeros work with +.
  '-00.',   # Ensure leading zeros work with -.
  '.00',    # .00 is equivalent to 0.0.
  '+.123',  # equivalent to 0.123.
  '4.6',
  '4',
  '+000001.00000001',
  '0004'    # Leading zeroes.
]

invalid_inputs = [
  '-+0',  # Only 0 or 1 -/+ is allowed.
  '%2.1',
  'a',
  '+',
  '-',
  '9a',
  '=',
  '/',
  '*',
  '4*2/3' # Don't allow operations. Only numbers.
]

run_tests(valid_inputs)
run_tests(invalid_inputs, false)
