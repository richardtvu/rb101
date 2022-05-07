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

### Question 4: What's the difference between the Array methods `#delete_at` and `#delete`? 

```rb
numbers = [1, 2, 3, 4, 5]

numbers.delete_at(1)
numbers.delete(1)
```

- `delete_at` will remove and return the item at the index psssed in. 
- - `delete` will remove the element whose value matches the value passed in. 

### 5. Programmatically determine if 42 lies between 10 and 100.

```rb
p (10..100).include?(42)
```

### 6. What are two different ways to pre-pend a sub-string to a string? 

```rb
derp = "x100"

puts complete_saying = "derp" + derp 

# Or second way... 
derp = "x100"
derp.sub!("x", "derpx")
puts derp

# Or third way. 

derp = "x100"
derp.prepend("derp", " ",)
puts derp

# 4th way 

derp = "x100"
puts 'derp '  << derp 
```

### 7. How do you un-nest an array? 

Use the `#flatten` method. 

```rb

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

p flintstones 

flintstones = flintstones.flatten
p flintstones
```

### 8. How do you get an array of only two elements from a hash with several key-value pairs? 

Manual: 
- Convert the hash into an array. 
- Assign sub-array representing the key-value pair of interest to a new variable.

```rb
h = {foo: 0, bar: 1, baz: 2}
kv = h.to_a[1] # => => [:bar, 1]
```

`#assoc` method:
- Input: Pass in the key. 
- Output: A new array containing the key-value pair or nil. 

```rb
h = {foo: 0, bar: 1, baz: 2}
h.assoc(:bar) # => [:bar, 1]
```





```

