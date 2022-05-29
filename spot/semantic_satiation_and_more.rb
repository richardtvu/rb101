# SPOT 2022-05-29

Keyword of the Day: **Semantic satiation**, when words lose meaning for a listener from overuse. 

## Written Assessment Prep 

- Zach Morgan's Strategy: Say as much as you are certain of. 
  - Show that you _know_ what you're talking about.
  - Minimize the chance of showing that you _don't know_ by saying less. 

### Block variables vs local variables? 
- Call the variables local variables. 

### Describe this line of code: 
```ruby
def greetings(str)  
  puts str        # Displays object that `str` point to. 
  puts "Goodbye"  
end

word = "Hello"
greetings(word)
```

- Zack: the local variable `word` is assigned to String `"Hello"`. `greetings` is called and passed the local variable `word` as an argument. The method local variable `str` is assigned to the String object `"Hello"`. 

How would you describe `puts word` if this line were after `greetings(word)`?
- Zack: Passing in local variable word, which points to the string "Hello". The line outputs "Hello". 

### How do you describe `break`?
- `break` is a Ruby keyword. 
- When line `break` executes, the `break` keyword causes the program to exit the loop. 

### How do you describe the `loop do`?
- We invoke `loop` and pass in a block. Then, just describe the code within the block..., e.g. "within in the block, we ..." 
- On line X a block is passed in as an argumnent. Inside the block on lines Y-Z. 

### How do you describe `p a` where `a => [1, 2, 3, 3]`? 
- We invoke `p` and pass in `a` as an argument, which displays `[1, 2, 3, 3]`.


### Given `array = [1, 2, 3, 4, 5]`, what happens in this code? 

```rb
array.each do |x|
  x += 2
  puts x
end
```

- Invoke `each` on the array pointed to by local variable `array`.
- On line `[blah]`, `puts` outputs the value of `x`.
- Specify _what_ will be assigned to:
  - e.g. On each iteration of `each`, `each` passes each element into the block, where the element is assigned to local variable `x`. 
- A parameter is only a parameter until we assign the parameter to a value, then it is a variable. 
  - Given the method header: `def some_method(arg)`, describe: `some_method("hello")`
    - We invoke `some_method` and pass in the string object `"hello"`. Within the method, we assign local variable `arg` to "hello". 


### Given `array = [1, 2, 3, 4, 5]`, describe what this code does and return? 

```rb
array.map do |x|
  x + 2
end 
``` 

We invoke `map` on the array referenced by `array` and pass in a block with a block parameter `x`. On each iteration of `map`, we pass in one element into the block and assign local variable `x` to the element. `map` uses the return value of the block to determine what `map` will transform the element into. `map` returns a new array in which each element has a value 2 greater than the original object that we invoked `map` on. 


### `select` vs. transformation?
- `select` uses the return value of block to choose which elements to return in an array. Select starts with `n` elements and ends with `n-1` elements. 
- transformation uses the return value of the block to determine how to change the elements and return the array of changed elements. Transformation begins and ends with the same # of elements. 


