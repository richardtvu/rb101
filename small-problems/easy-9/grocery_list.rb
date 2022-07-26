=begin
- Input: Array of arrays (subarrays are [fruit, quantity])
- Output: Array
- Requirements:
  - The array will be a single-dimensional array with as many fruit as indicated by the sum of the quantities.

Data Structure?
- Array

Algo?
- Iterate over the sub-arrays.
  - Convert the sub-arrays containing fruit and quantity into just fruit.
- Combine the only fruits arrays.
- Return the resulting array.

=end

# Initial Solution
def buy_fruit(grocery_list)
  grocery_list.map do |fruit_quantities|
    [fruit_quantities[0]] * fruit_quantities[1]
  end.flatten
end

# Refactored Solution

def buy_fruit(grocery_list)
  grocery_list.map { |fruit, count| [fruit] * count }.flatten
end

p buy_fruit([['apples', 3], ['orange', 1],
             ['bananas', 2]]) == %w(apples apples apples orange bananas
                                    bananas)
