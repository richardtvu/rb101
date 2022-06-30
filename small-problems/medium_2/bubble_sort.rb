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

# Further Exploration - Tail End Optimization: Using Helper 
# Methods and More Descriptive Variable Names In An Attempt to
# Make Bubble Sort Easier to Understand 

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
Here's how I understand the `bubble_sort!` with the tail-end recursion: On the first iteration, the largest number will end up at the end. Therefore, you don't have to check the last index. On the second iteration, the 2nd largest number will end up in the 2nd to last index. You can ignore the 2nd to last index now. After the n-th iteration, you can ignore the comparing the elements in n-th to last index. 

In other words: After you've sorted an element correctly, you get to ignore that element and any elements that come after. Let's look at Launch School's example and condense it: 

```ruby
[6, 2, 7, 1, 4] # 6 > 2, so swap those two.
[2, 6, 7, 1, 4] # 7 > 1, so swap 1 & 7.   
[2, 6, 1, 7, 4] # 7 > 4, so swap 4 & 7.
[2, 6, 1, 4, 7] # 6 > 1, so swap 6 & 1.

# 7 is now correctly sorted, so you can stop processing 7. 
[2, 1, 6, 4, 7] # 6 > 4, so swap 6 & 4. 

# 6 is now correctly sorted, so you ignore 6 and 7. 
[2, 1, 4, 6, 7] # 2 > 1, so swap 2 & 1. 

# 4 is correctly sorted, so you ignore 4 and everything else.
[2, 1, 4, 6, 7] # 2 > 1, so swap 2 & 1. 

# 2 is now correctly sorted, so you ignore 2 and everything after. 
[1, 2, 4, 6, 7] 

# 1 is correctly sorted because there isn't another element to compare 1 with.
[1, 2, 4, 6, 7] # No more swaps. Done. 
``` 

You can notice how the tail-end optimization means we sort through less and less elements. By contrast, the unoptimized bubble sort will keep trying to sort elements until the end of the list... even if those elements are already sorted. 

Although bubble sort is still pretty bad, you can take the further exploration as an example of how to make your algorithms more efficient. In the future, when you want to refactor/make an algorithm more efficient, you can ask yourself: "Am I duplicating any steps? Do I have to iterate through the entire list every time?"

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