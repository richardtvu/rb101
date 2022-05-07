# Hard 1 Practice Problems 

## 1. What happens when you reference a local variable defined in an `if` statement that evaluates to `false`?

The local variable is initialized to `nil`, even if the `if` statement doesn't run. Therefore, referencing that local variable will return `nil`. 

```rb
if nil 
  derp = "Derpy"
end 

p derp # prints nil to screen 
```

## 2. WHat do this code output? 

```rb
matrix = { person: "Neo" }
person = matrix[:person] 
person << ", the Chosen One" 

puts person # "Neo, the Chosen One" 
puts matrix # Expectation: { person: "Neo, the Chosen One" }

```

The `matrix` variable is initialized and assigned to the hash, which contains a key, which is the symbol `:person` and a value, the string `"Neo"`: `{ person: "Neo"}`.

The `person` variable is initialized and assigned to the string referenced by `matrix[:person]`, `"Neo"`. 

The `String#<<` method is invoked on the string "Neo" with an argument of `", the Chosen One"`. The string "Neo" was mutated into `"Neo, the Chosen One"`. 

The `matrix` will output a hash in which the value for `:person` points to the mutated string, `"Neo, the Chosen One"`. 

### 4. Rewrite this method to return a false condition and for IP addresses with more or less than 4 parts. 

```rb
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break unless is_an_ip_number?(word)
  end
  return true
end
``` 

Input: A string 
Output: Boolean 
Requirements: 
- Return a false condition. 
- Return false for IP addresses that have more or less than 4 components, e.g. "4.5.5". 

Examples: 
- '4.5.5' => False 
- '1.2.3.4.5' => False 
- '1.1.1.1' => True 

Data Structures? 
- Intermediate: Array

Algorithm: 

- SET dot_separated_words = Split the input string into separate numbers. 
- IF the number of numbers is more or less than 4, then return false. 
- ELSE
  - WHILE there are more than 0 words left in dot_separated_words
    - Remove the last word from dot_separated_words and assign that last word to `word` 
    - Return false _unless_ the word is an ip number. 
  - Return true. 
 
Code? 

```rb
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false if dot_separated_words.size != 4
  
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end
  
  true
end
```