def sum_multiples(target, factors)
  multiples = []
  factors = [3, 5] if factors.empty?
  factors.each do |factor|
    current_multiple = factor
    while current_multiple < target
      multiples << current_multiple
      current_multiple += factor
    end
  end
  multiples.uniq.sum
  # alternative is multiples.uniq.inject(0, :+)
end

# Test cases
def test(target, factors, expected_result)
  puts "Target: #{target}"
  puts "Factors: #{factors}"
  puts "Expected: #{expected_result}"
  puts "Actual: #{result = sum_multiples(target, factors)}"
  puts "Passed? #{result == expected_result}"
end

test(0, [], 0)
test(1, [1], 0)
test(7, [2, 3], 2 + 4 + 6 + 3)
test(6, [], 8)
test(20, [19], 19)
