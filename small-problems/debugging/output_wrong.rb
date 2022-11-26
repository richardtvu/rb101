arr = ["9", "8", "7", "10", "11"]
p arr.sort do |x, y|
    y.to_i <=> x.to_i
  end

# Expected output: ["11", "10", "9", "8", "7"]
# Actual output: ["10", "11", "7", "8", "9"]

=begin
The precedence for `do..end` is lower than the binding of `p` to the `arr.sort` invocation. Therefore, we will sort using the string implementation of the `<=>` operator instead of the integer implementation.

=end