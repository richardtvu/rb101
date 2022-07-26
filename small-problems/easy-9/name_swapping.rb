=begin
- Input: String (first name, space, last name)
- Output: String (last name, comma, space, first name)
- Data Structure?
  - Array.
- Algo:
  - Split the argument into first and last name.
  - Return the last name, first name.

=end

# Initial Solution
def swap_name(first_Last_name)
  first_name, last_name = first_Last_name.split
  "#{last_name}, #{first_name}"
end

p swap_name('Joe Roberts')
