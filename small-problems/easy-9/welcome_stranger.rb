=begin
Welcome Stranger

- Inputs: Array & Hash
- Output: String
- Requirements:
  - Array has 2+ elements that form a full name when combined.
  - Hash has 2+ keys `:title` and `:occupation`.
  - _Return_ a greeting that uses the full name and
  addresses the person by their title and occupation.

Example:
- Array: ['William', 'T.', 'Sherman']
- Hash: { title: 'Brigadier General', occupation: 'Soldier'}
=> "Welcome Soldier! We, the United States Army,
    congratulate you on your recent victory.
    All our soldiers bear witness to the
    promotion of William T. Sherman to
    Brigadier General."

Data Structure/Algo:
- Given the array and hash.
- Get the full name from the Array.
- And put the full time, title, and occupation into the string.
- Return the string.

=end

# Further Exploration
UNION = { name: 'Union', representative: 'United States Army' }

def greetings(name_arr, title_occupation_hash, organization = UNION)
  full_name = name_arr.join(' ')
  title = title_occupation_hash[:title]
  occupation = title_occupation_hash[:occupation]
  representative = organization[:representative]

  %(Welcome #{occupation}! We, the #{representative},
  congratulate you on your recent victory.
  All our #{occupation.downcase + 's'} bear witness to the
  promotion of #{full_name} to
  #{title}.

  Long live the #{organization[:name]}!
  )
end

puts greetings(
  ['William', 'T.', 'Sherman'],
  { title: 'Brigadier General', occupation: 'Soldier' }
)
