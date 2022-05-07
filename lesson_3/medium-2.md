# Medium 2 Practice Problems 

## 1. What will the following output? 

```rb
the_avatar = "Aang" 
name = "Aang" 
main_character = the_avatar

puts the_avatar.object_id  # some val 
puts name.object_id # A diff val 
puts main_character.object_id # The same val as `the_avatar`. 
```

## 2. Output of invoking `object_id` on an integer? 

```rb
answer_to_life = 42 
seven_times_six = 42 
desire = answer_to_life 

puts answer_to_life.object_id
puts seven_times_six.object_id
puts desire.object_id

# Expect all these object ids to be the same because an integer is immutable. 
``` 

## Alter the following code, so that the arguments aren't mutated but reassigned to new values. 

```rb 
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end
```

```rb
def tricky_method(object) 
  if object.is_a? String 
    object += "rutabaga" 
  else 
    object += ['rutabaga']
  end   
end 


my_string = "pumpkins"
my_array = ["pumpkins"]
my_string = tricky_method(my_string)
my_array = tricky_method(my_array) 

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
```

## 6. How can you simplify an `if..else` statement? 

```rb
def derp?(to_derp)
  if to_derp == "yes" || to_derp == "maybe"
    true 
  else 
    false
  end 
end 
```

You can use `modifiers`, e.g. `do_something() if conditional`. 

```rb 
def derp?(to_derp)
  return true if to_derp == "yes" || to_derp == "maybe"
  false
end 
# OR 
def derp?(to_derp)
  to_derp == "yes" || to_derp == "maybe"
end 
```