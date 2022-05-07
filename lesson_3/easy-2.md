# Practice Problems: Easy 2

## 1. Given a hash, how do you check if a key is present? 

Use the methods: 
- `#include?` 
- `#key?` 
- `#has_key?`
- `#member?`

Use a ternary. 

```rb
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.include?("Spot") 
ages.key?("Spot") 
ages.has_key?("Spot") 
ages.member?("Spot")
ages["Spot"] ? true : false
```

## 2. Given a string of words, how do you: 


`reality_based_rules_paraphrase = "Decreasing your Emotional Expensiveness has the most impact on your value to your workplace." ` 

```rb
str = reality_based_rules_paraphrase 
# Reverse the case for each character? 
puts str.swapcase!

# Capitalize only the first letter of the string? 
puts str.capitalize!

# Lowercase all letters? 
puts str.downcase!

# Uppercase all letters?
puts str.upcase!
```

## 3. Given a hash, add key-value pairs to the hash. 

```rb
score = {wins: 0}
score[:ties] = 0
score[:losses] = 0
p score
```

## 4. Given a string and substring, return whether the substring appears in the string. 

```rb
str = "You are worthy of the boundaries you need to give your gift and love to the world." 
substr = "love" 
puts str.include?(substr)
```

Alternative string method: `match?`

## 5. Declare an array without using `[]`

```rb
carebears = %w(Sunshine Tenderheart Cheerbear)
```

## 6. Given a string, add the string to the `carebears` array

```
# Mutating 
str = "Notbear" 
carebears << str
carebears.push(str) 
carebears.append(str)
carebears.concat([str])

# Non-mutating Reassignment
carebears = carebears + [str]
```

## 7. Given multiple strings, add these strings to the `carebears` array in #5

```
superhero = "Static Shock" 
villain = "Joker" 

# Mutating 
carebears.push(superhero, villain)
carebears.concat([superhero, villain])

# Mutating, using array literal 
carebears.concat(%w(superhero, villain))
```

## 8. Use `String#slice!` to mutate a string and return a substring


```
affirmation = "You are worthy of the boundaries you need to give your gift and love to the world." 

p affirmation.slice!(0, 32)
```

Now, how would you return `"You are worthy"` using the `#slice` method, without explicitly passing in the index for `'y'`?

```rb
p affirmation.slice!(0, affirmation.index(' of')) # => You are worthy. 
p affirmation
```

# 9. Count the # of lowercase 'y' characters in the affirmation string:

```rb
affirmation = "You are worthy of the boundaries you need to give your gift and love to the world."
p affirmation.count('y')
``` 

# 10. Given a string and a table 48 chars in width, center the string above the table with spaces. 

```rb
welcome = "Welcome to Antartica!"
things_to_do = %w(ski hike swim battle rob pray)
puts welcome.center(48) 
p things_to_do
```

