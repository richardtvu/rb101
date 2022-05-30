def multiply_all_pairs(arr1, arr2)
  arr1.product(arr2).map {|arr| arr.inject(:*)}.sort
end 

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]