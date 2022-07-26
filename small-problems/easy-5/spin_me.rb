# Spin Me Around in Circles
=begin
- Input: String of words.
- Output: String, each word is reversed.

- Goal? Determine if returned str is same obj as the passed in str.

We invoke `spin_me` and pass in the string `"hello world"` as an argument. Within the method, we assign the local variable `str` to `"hello world"`. Then, we invoke `split` on the string referenced by hello world. `split` returns a new array containing the words in `"hello world"`: `['hello', 'world']`. We invoke `each` on this array and pass in a block. On each iteration of `each`, we pass in a word and invoke the mutating method `reverse!` on the word. `reverse!` goes directly to the memory location for the 'hello' and 'world' strings to reverse their values. We now have an array of reversed words, `["olleh", "dlrow"]`. We invoke `join` on this array with an argument of `" "`. The return value of this expression is a new string object.

=end

def spin_me(str)
  maybe_new_str = str.split.each do |word|
    word.reverse!
  end.join(' ')
  p "inside method object_id: #{maybe_new_str.object_id}"
  maybe_new_str
end

str = 'hello world'
p "before method object_id: #{str.object_id}"

p spin_me(str)
