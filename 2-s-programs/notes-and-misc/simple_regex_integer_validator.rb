def integer?(input)
  /^-?\d+$/.match(input)
end

puts integer?('10') ? true : false
puts integer?('4.5') ? true : false
