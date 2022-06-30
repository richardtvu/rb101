=begin 
Input: Unsorted array 
Output: Sorted array 
Requirements: 
- Iterate through array:
  - Compare current element with next element. 
  - If the current element is greater than the second, swap the two elements. 
- Repeat above until there are no more swaps to perform. 
- THe sorting must be in-place, mutating the array. 
- The array will have at least two elements. 
- Arrays will contain elements of the same dat type? 
Examples: [5,3] --> [3,5]

Data Structure?
- Array 

ALgorithm: 
- Iterate through each element in array... 
  - If the element is greater than the next element, then swap the elements in-place. 
- Repeat above until no more sorts are performed. 
=end 

def swap_curr_with_next!(arr, index) 
  arr[index], arr[index+1] = arr[index+1], arr[index]
  arr  
end 

def bubble_sort!(arr) 
  loop do 
    swapped = false 
    arr.each_with_index do | element, ind | 
      if (ind+1 < arr.size) && element > arr[ind+1] 
        swap_curr_with_next!(arr, ind)
        swapped = true 
      end 
    end 
    break unless swapped 
  end 
  nil
end 

def bubble_sort!(arr) 
  n = arr.length 
  loop do 
    swapped = false 
    for i in (1..n-1)
      if arr[i-1] > arr[i] 
        arr[i-1], arr[i] = arr[i], arr[i-1]
        swapped = true 
      end 
    end 
    n -= 1 
    break unless swapped 
  end 
end 

def bubble_sort!(arr) 
  n = arr.size 
  loop do 
    new_n = 0 
    for i in (1..n-1) 
      if arr[i-1] > arr[i]
        arr[i], arr[i-1] = arr[i-1], arr[i]
        new_n = i 
      end 
    end 
    n = new_n
    break if n <= 1
  end 
end 

# Further Exploration - Tail End Optimization
def swap!(arr, prev_i, curr_i) 
  arr[curr_i], arr[prev_i] = arr[prev_i], arr[curr_i]
  nil 
end 

def bubble_sort!(arr) 
  last_index_to_check = arr.size 

  until last_index_to_check <= 1
    last_index_swapped = 0 

    1.upto(last_index_to_check-1) do |index|
      if arr[index-1] > arr[index] 
        swap!(arr, index-1, index)
        last_index_swapped = index 
      end 
    end 

    last_index_to_check = last_index_swapped
  end 
  nil
end 

=begin 
When Launch School (LS) says that the optimization "skips looking at tail elements", I think LS 

=end 



array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]


array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)