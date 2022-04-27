# Coding Tips 

- Make method names describe the _intent_, not the implementation, e.g. `play()` shows intent. `iterate_over_array` shows implementation. 
- Allow methods to _either_ return a value _or_ do a side-effect, but NOT both. 
  - Separate return methods from side-effect methods makes the process of using the methods easier and thereby improves debugging/maintenance. 
- Don't include `return` in the method name. All methods return a value, even if the value is `nil`. 
- Signify that a method mutates something in the method name, e.g. `insert_date`. 
- When writing methods to display values, refrain from returning a value or mutating objects. 
  - Use a prefix, e.g. `print_` or `display_`. 
- Ensure that usage of method can be understood _without_ looking at implementation. 
- Name methods based on how you'd invoke the methods, e.g. To pick a quarterback from an array of `players`, define `get_quarterback` and call `quarterback = get_quarterback(players)`. 
-  