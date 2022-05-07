# Medium 1 Practice Problems

## 1. Given a string, print the string on a new line 10 times and indent each subsequent line, using only one line of code. 

```rb
msg = "Here we are." 
10.times { |time| puts " "*time + msg}
```

## 2. Why does this statement output an error? 

```rb
puts "70 - 1 =" + (70-1)
```

This statement attempts to add a string and an integer together, but Ruby does not support implicit conversions from int to string. To fix this: 
1. Convert the number to a string: `(70-1).to_s`
2. Or use interpolation `puts "70 - 1 = #{(70-1)}"`


## 3. Given a method, how do you guard against inputs that are less than or equal to 0? 

```rb
def method(input) 
  return [] if input <=0
  #...rest of code 
  end 
```

The purpose of `number % divisor == 0` is figure out whether a number divided by the divisor is a factor of the number. 

The purpose of reference a variable on the last line before the `end` of a method is to ensure the method returns the variable. 

## 4. `<<` vs `+`

The shovel operator, `<<` mutates the calling object. `+` will create a new object instead of mutating the calling object. 

## 5. When a local variable is out of the scope for a method, what can you do get the value referenced by the variable in the method scope? 

- You could make the local variable a constant or global variable. 
- You can pass the local variable in as an argument to the method. 

## 6. Can reassignment mutate an object? 

Reassignment points a variable to a different object instead of mutating an object. Thus, if the reassignment looks like `variable = variable + 3`, then the original object referenced by variable won't be changed. Instead, a new object is created and assigned to `variable`. 

## 7. Hash Elements: Can you reassign the elements to different values from within a method? 

```rb
matrix = {
  Neo: {status: "alive", power_level: 8001},
  Trinity: {status: "missing", power_level: 2032},
  Morpheus: {status: "in-between existences", power_level: 2401}
}

def alter_the_matrix(matrix) 
  matrix.each do |person, stats|
    stats[:status] = 'in hyperbolic time chamber' 
    stats[:power_level] += 1000 
  end 
end 

alter_the_matrix(matrix) 
```

When we invoke the `alter_the_matrix` method, we pass in the `matrix` variable. We invoke the `each` method on `matrix` and iterate through each `person`. We reassign the `person[:status]` to `'in hyperbolic time chamber.'` and reassign the `person[:power_level]` to the value referenced by `person[:power_level]` plus `1001`. 


