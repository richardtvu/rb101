=begin
Madlibs

- Inputs: 4 strings
- Output: 1 string
- Requirements:
  - Return string containing the user-inputted strings and some preset story.
  - Implicit requirements:
    - One word?

    Do user input strings need to be validated?
    How many nouns, verbs, etc. can the users input?
    Can I assume the user will input a valid noun, verb, etc?

You would like to [verb] my [adjective] rooster?
Why don't you go eat a [noun] [adverb]!

Data Structures?

Get and validate noun, verb, adjective, and adverb.

Print the resulting story.

=end

def example(word_type)
  case word_type
  when 'noun'       then 'soybean'
  when 'verb'       then 'eat'
  when 'adjective'  then 'burly'
  when 'adverb'     then 'sensuously'
  end
end

# If we need to validate, then I'll further develop this...
def get_valid_word(word_type)
  user_input = ''
  loop do
    puts "Please input #{word_type}, e.g. #{example word_type}:"
    user_input = gets.chomp
    break user_input unless user_input.empty?
  end
end

def mad_libs
  noun = get_valid_word('noun')
  verb = get_valid_word('verb')
  adj  = get_valid_word('adjective')
  adv  = get_valid_word('adverb')

  puts %(
    You would like to #{verb} my #{adj}
    rooster? Why don't you go eat a
    #{noun} #{adv}!
  )
end

mad_libs
