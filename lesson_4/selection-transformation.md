# 4.7: Selection and Transformation 

- Selection? 
- Transformation? 


- 4 basics of looping for selection and transformation? 
  1.

- What to keep in mind when doing transformations? 
  - Mutation vs. new collection 


How to select key-value pairs where the value is `x`? 
- Given a hash, e.g. `produce`, containing key-value pairs, e.g. `{'banana': 'Fruit'}`. 
- Initialize and assign a `fruits` variable to an empty hash. 
- Iterate through each pair in the `produce` hash. 
  - If the value in the pair is `Fruit`. 
    - Append the key-value pair to the `fruits` hash. 
- Return `fruits`. 


```rb

def select_fruit(produce) 
  fruits = produce.select do |key, val|
    val == 'Fruit'
  end 
end 

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}
select_fruit(produce)
```