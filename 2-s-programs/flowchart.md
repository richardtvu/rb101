# Given N groups of nums, print biggest num in each group of nums. 

# e.g. [[1,2,3], [4, 1], [3,3,3]] prints 3, 4, 3, 
# START 
# WHILE the user wants to keep going
#   Ask user for group of numbers
#   Ask the user if they want to keep inputting groups of numbers 
# 
# Iterate through each group in groups of nums 
# SET largest_nums = []
# FOR each group in groups
#   SET current_max = first number in group 
#   FOR each number in group
#     IF current number > current_max
#     SET current_max = current_number 
#   SET largest_nums = largest_nums with current_max appended to end 
# PRINT largest_nums 
# END 


