=begin
Fix the Bug
https://launchschool.com/exercises/143443fd

Why does this code fail to produce the expected output?
=end

def my_method(array)
  if array.empty?
    []
  elsif array.map do |value|
          value * value
        end
  else
    [7 * array.first]
  end
end

# Tests                |  Expected Output    | Actual Output
# -------------------- | ------------------- | -------------
p my_method([])         # []                 | []
p my_method([3])        # [21]               | nil
p my_method([3, 4])     # [9, 16]            | nil
p my_method([5, 6, 7])  # [25, 36, 49]       | nil

=begin
What's wrong?

The `elsif` branch doesn't have a conditional expression passed in as expression, so the branch looks to the next code the conditional expression. Ruby treats `array.map do..end` as the conditional. Because `map` always returns an array, this "conditional" will always be truthy. There is no code after the `map` invocation, so the elsif branch will return `nil` for each invocation of `map` with a non-empty array as an argument.

A branch without code returns `nil`.
=end
