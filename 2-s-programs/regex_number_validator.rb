=begin
  # https://medium.com/launch-school/number-validation-with-regex-ruby-393954e46797
  Code and explanation from above link. 

  /        start of the regex
  \A       start of the string to be matched
  [+-]?    0 or 1 of '+' or '-', to account for positive and negative numbers. 
  \d+      0+ digit(s)
  (\.\d+)? 0 or 1 of '1 dot && '1+ digit(s)'' 
  \z       end of string to be matched
  /        end of Regex
  
=end
class Validator
  def self.number?(obj)
    obj = obj.to_s unless obj.is_a? String
    /\A[+-]?\d+(\.[\d]+)?\z/.match(obj)
  end
end
