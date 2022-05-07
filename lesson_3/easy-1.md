# Practice Problems: Easy 1 

## Question 1: What would you expect the code below to print out?

```rb
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers
``` 

- The `numbers` variable is initialized and assigned to the array `[1, 2, 2, 3]. 
- `#uniq` is invoked on the array and returns a new array containing `[1, 2, 3]`. However, the original array referenced by `numbers` remains the same. 
- `puts numbers` prints out 1, 2, 3, and 4 on separate lines because of the `puts` method. 


## Question 2: Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:

- The `!` operator stands for "NOT", so `!true` would evaluate to `false` and `!false` would evaluate to `true`. `!` at the end is part of the method name. 
- `!=` is a comparison operator, so you'd use this in a conditional. 
- `!user_name` would return true when `user_name` is `false` or `nil` and `false` if the `user_name` is truthy. 
- `words.uniq!` would mutate the object references by `words`, so that only unique elements would remain.
- Placing `? :` is a ternary operator. 
- Putting `!!` before something will evaluate to whatever value the object would've ealuated to in a conditional expression. e.g. if `user_name` would've evaluated to `true` in an `if` statement, then `!!user_name` would do the same. TUrns object into boolean equivalent. 

### Question 3: Replace the word "important" with "urgent" in this string: 

```rb
advice = "Few things in life are as important as house training your pet dinosaur."

advice = advice.gsub("important", "urgent") 
# OR 
advice.gsub!("important", "urgent")
``` 


