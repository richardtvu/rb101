# Problem Bank 

## `Hash` - `select`. 

```
words = %w(hello goodbye goodnight)
hash = {}

words.each do |word|
  hash[word] = word.length
end


new_hash =
  hash.select do |_,v|
    v > 5
  end

p new_hash
```

Describe the `new_hash` code: 

We initialize the local variable `new_hash` to the return value of invoking `select` on the Hash referenced by the local variable `hash`. We invoke the `select` method on the hash referenced by `hash` and pass in a block. The block follows method invocation and is delimited by the keywords `do...end`. We pass each key-value pair in `hash` to the block and assign each value to the parameter `v`. The block returns a boolean based on whether the current value, referenced by `v` is greater than 5. `select` uses the truthiness of the block's _return value_ to choose elements to add to a new array. A truthy value evaluates to `true` when used in a boolean context and is any value other than `false` or `nil`. Thus, the block returns a truthy value for the key-value pairs `"goodbye" => 7` and `"goodnight" => 9`. Therefore, `select` returns the _new hash__ `{"goodbye" => 7, "goodnight" => 9}`. 
