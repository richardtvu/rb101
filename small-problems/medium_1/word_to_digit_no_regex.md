## No Regex Solution

While this problem encourages regex, it is entirely possible to do this problem without regex. This solution emphasizes that as an RB109 student, regex isn't always necessary and that you _can_ do problems without regex (although the doing might be harder).

Note: While there's a lot more code and steps to this solution, this solution may make it easier to do the further exploration because (as far as I know) it solves the problem of preserving punctuation and separating words from non-letters (e.g. ' four.' -> ' ', 'four' and '.')

```ruby
def letter?(char)
  return false unless char

  ('a'..'z').include?(char.downcase)
end

def digit_str(substr)
  WORDS.index(substr.downcase).to_s
end

def is_num_str?(substr)
  WORDS.include?(substr.downcase)
end


def whole_words_and_non_words(str)
  word_str = ""

  substrings_arr = str.chars.each_with_object([]) do |char,substrs_arr|
    if letter?(char)
        word_str += char
    else
      substrs_arr << word_str.dup
      word_str = ""

      substrs_arr << char
    end
  end

  substrings_arr << word_str.dup if letter?(word_str[-1])
  substrings_arr
end


def word_to_digit(str)
  strings_arr = whole_words_and_non_words(str)

  transformed_strs = strings_arr.map do |substr|
    if is_num_str?(substr)
      digit_str(substr)
    else
      substr
    end
  end
  transformed_strs.join
end
```
