def merge(first_arr, second_arr)
  idx_2nd_arr = 0
  merged_arr = []

  first_arr.each do | num |
    while idx_2nd_arr < second_arr.size && if second_arr[idx_2nd_arr] <= num
        merged_arr << second_arr[idx_2nd_arr]
        idx_2nd_arr += 1
      end
    end
    merged_arr << num
  end

  p merged_arr.concat(second_arr[idx_2nd_arr..-1])
end

merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
merge([], [1, 4, 5]) == [1, 4, 5]
merge([1, 4, 5], []) == [1, 4, 5]